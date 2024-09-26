extends Node


func _instance_element(_element_data : element_data):
	
	_element_data.Object_on_Board = true

	var _instance = _element_data.element_prefabs.instantiate()
	_global_datas.movable_root.add_child(_instance)
	_instance.global_position = _global_datas.board_instance_position.global_position + Vector3(0.0,0.05,0.0)
	_instance.set_element(_element_data)
