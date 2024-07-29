extends Node

var using_pad : bool = false

func _ready():
	_global_datas.using_pad.connect(_switch_inputs)
	



func _switch_inputs(condition : bool):
	
	if !_global_datas.Player_In_Inventory:
		return

	using_pad = condition
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		if _global_datas.Player_In_Inventory:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	

