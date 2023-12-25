extends Node

@export var disable_mouse = true

func _ready():
	
	if disable_mouse:
		return
		
	_global_datas._open_board.connect(enable)
	_global_datas._close_board.connect(disable)
	_global_datas._go_Subscene.connect(disable)
	_global_datas._go_Mainscene.connect(enable)
	

	
func enable():
	mouse_enable(true)
	
func disable():
	mouse_enable(false)	
	
	
func mouse_enable(condition):
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else :
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
