extends Node


@export var On_Move : Node

func _ready():
	On_Move.On_Move.connect(call_next)
	
	
func call_next(condition):
	
	if condition:
		_global_datas.check_element_to_open.emit()		
