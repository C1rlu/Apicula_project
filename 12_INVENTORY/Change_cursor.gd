extends Node


func _ready():
	_global_datas.Cursor_mode = self


func cursor_in():
	
	if _global_datas.Player_lock_click:
		return
	var value = 2 as int 
	Input.set_default_cursor_shape(value)
	
func cursor_out():
	if _global_datas.Player_lock_click:
		return
	var value = 0 as int 
	Input.set_default_cursor_shape(value)
	
