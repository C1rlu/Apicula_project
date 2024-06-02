extends Node
@onready var pad_target = $"../3D_SCENE/SubViewport_book_render/Pad_target"



func _ready():
	_global_datas.using_pad.connect(_switch_inputs)
	

func _switch_inputs(condition : bool):
	
	pad_target.visible = condition
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		if _global_datas.Player_In_Inventory:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
