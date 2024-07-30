extends Node
@onready var pad_target = $"../3D_SCENE/Pad_target"


var using_pad : bool = false

func _ready():
	_global_datas.using_pad.connect(_switch_inputs)
	_global_datas.open_inventory.connect(close_pad_target)



func _switch_inputs(condition : bool):
	
	if !_global_datas.Player_In_Inventory:
		return

	pad_target.visible = condition
	using_pad = condition
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		if _global_datas.Player_In_Inventory:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	

func close_pad_target(condition):
	
	if using_pad:
			pad_target.visible = condition
	

