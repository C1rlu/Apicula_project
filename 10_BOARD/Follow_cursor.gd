extends Node

@onready var cursor_icon = $".."



var using_pad : bool = false
func _ready():
	_global_datas.using_pad.connect(_using_pad)
	
	
func _using_pad(condition : bool):
	
	using_pad = condition
	if condition:
		var mouse_position = get_viewport().get_mouse_position()
		cursor_icon.position = mouse_position
func _process(delta):
	
	if using_pad:
		return
			
	var mouse_position = get_viewport().get_mouse_position()
	cursor_icon.position = mouse_position
