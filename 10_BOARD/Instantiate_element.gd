extends Node


@export var Drop_Element_State : Node

func _ready():
	Drop_Element_State.instantiate_on_board.connect(_instantiate)
	
	
func _instantiate(element : element_data):
	
	print(element.element_name, " has been instantiate")
	element.Object_on_Board = true

	var _instance = element.element_prefabs.instantiate()
	_global_datas.movable_root.add_child(_instance)
	
