extends Node

@export var _on_over : Node3D
@export var _on_over_second: Node3D
@export var icon_type : icon_class.icon_list
@export var move_node : Node3D
var move_node_position : Vector3
func _ready():
	
	_global_datas.close_all_over_ui.connect(close)
	if move_node:
		move_node_position = move_node.global_position
func on_over(condition):
	
	if _on_over:
		_on_over.visible = condition	
	if _on_over_second:
		_on_over_second.visible = condition
		
	_global_datas.switch_icon_cursor.emit(icon_type)


	if move_node:
		move(condition)
		
func move(condition : bool):
	
	if condition:
		
		move_node.global_position = move_node_position + Vector3(0.002,0.01,0.01)
	else:
		move_node.global_position  = move_node_position	
		
func close():
		
	if _on_over:
		_on_over.visible = false	
	if _on_over_second:
		_on_over_second.visible = false
	if move_node:
		move(false)
