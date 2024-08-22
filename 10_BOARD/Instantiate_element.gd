extends Node


@export var Drop_Element_State : Node
const ELEMENT_TO_BROKE = preload("res://10_BOARD/Element_Broke/Element_To_Broke.tscn")

func _ready():
	Drop_Element_State.instantiate_on_board.connect(_instantiate)
	
	
func _instantiate(element : element_data):
	

	var _instance = ELEMENT_TO_BROKE.instantiate()
	_global_datas.movable_root.add_child(_instance)
	_instance.global_position = _global_datas.board_instance_position.global_position
	

	# set element inside
	_instance._setup_element(element)
