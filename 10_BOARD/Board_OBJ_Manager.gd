extends Node


@export var Proto_element : Array[element_data]

signal create_element_on_board(element : element_data)

@export var active_test : bool = false
func _ready():
	_global_datas.add_collect_element.connect(_add_element)
	
	if active_test:
		_global_datas.element_collected.append_array(Proto_element)


func _add_element(element : element_data):
	print(element.element_name, " is collected")
	
	_global_datas.element_collected.append(element)


