extends Node

var disable_show : bool = false


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	_global_datas._open_dialogue.connect(_show)
	_global_datas._close_dialogue.connect(_hide)
	_global_datas.open_inventory.connect(condition)
	_global_datas.using_pad.connect(_disable_show)
		
func _disable_show(_condition : bool):
	disable_show = _condition	

func _hide():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _show():
	if !disable_show:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func condition(_condition : bool):
	
	if _condition:
		_show()
	else:
		_hide()	
