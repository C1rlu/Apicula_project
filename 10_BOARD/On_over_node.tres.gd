extends Node

@export var _on_over : Node3D
@export var _on_over_second: Node3D
@export var icon_type : icon_class.icon_list

@export var mesh_node : Node3D
var mesh_node_pos : Vector3

var is_moved : bool = false

func _ready():
	
	_global_datas.close_all_over_ui.connect(close)
	if mesh_node:
		mesh_node_pos = mesh_node.global_position
func on_over(condition):
	

	if _on_over:
		_on_over.visible = condition	
	if _on_over_second:
		_on_over_second.visible = condition

	_global_datas.switch_icon_cursor.emit(icon_type)
	

	if condition:
		
		if mesh_node:
			var random = randf_range(0.01,0.015)
			mesh_node.global_position = Vector3(mesh_node_pos.x +  random,mesh_node_pos.y,mesh_node_pos.z+ random) 
		
	else :
		if mesh_node:
	
			mesh_node.global_position = mesh_node_pos
			
func close():
	
	if _on_over:
		_on_over.visible = false	
	if _on_over_second:
		_on_over_second.visible = false
		
	if mesh_node:	
		mesh_node.global_position = mesh_node_pos
		is_moved = false
