extends Node


@export var Proto_element : Array[element_data]

signal create_element_on_board(element : element_data)

@export var active_test : bool = false
func _ready():
	
	
	if active_test:
		_global_datas.element_collected.append_array(Proto_element)



