extends Node


@export var _on_over : Node3D
@export var _on_over_second: Node3D
@export var icon_type : icon_class.icon_list
@export var move_node : Node3D
@export var position_over : Vector3 = Vector3(0.002,0.01,0.01)
@export var rotation_over : Vector3 = Vector3.ZERO

var move_node_position : Vector3
var node_rotation_degrees : Vector3

signal on_over_signal(condition : bool)

func _ready():
	
	_global_datas.close_all_over_ui.connect(close)
	if move_node:
		move_node_position = move_node.global_position
		node_rotation_degrees = move_node.rotation_degrees
		
func on_over(condition):
	
	if _on_over:
		_on_over.visible = condition	
	if _on_over_second:
		_on_over_second.visible = condition
		
	_global_datas.switch_icon_cursor.emit(icon_type)

	on_over_signal.emit(condition)
	
	if move_node:
		move(condition)
		
func move(condition : bool):
	
	if condition:
		
		move_node.global_position = move_node_position + position_over
		if rotation_over != Vector3.ZERO:
			move_node.rotation_degrees = node_rotation_degrees + rotation_over	
	else:
		move_node.global_position  = move_node_position	
		move_node.rotation_degrees = node_rotation_degrees
func close():
		
	if _on_over:
		_on_over.visible = false	
	if _on_over_second:
		_on_over_second.visible = false
	if move_node:
		move(false)
		
	on_over_signal.emit(false)
