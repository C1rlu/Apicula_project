extends Node

var disable_show : bool = false


func _ready():
	pass
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#
	#_global_datas._open_dialogue.connect(_show)
	#_global_datas._close_dialogue.connect(_hide)
	#_global_datas.open_inventory.connect(condition)
	#_global_datas.using_pad.connect(_disable_show)
	#_global_datas._open_menu.connect(condition)	
	#_global_datas._open_shop.connect(condition)
	
func _disable_show(_condition : bool):
	disable_show = _condition	
	

func _hide():
	
	#if _global_datas.Player_In_Inventory:
		#return
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _show():
	if !disable_show:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func condition(_condition : bool):
	
	
	if _condition:
		_show()
	else:	
		if !_global_datas.Player_InDialogue:	
			_hide()	
	
