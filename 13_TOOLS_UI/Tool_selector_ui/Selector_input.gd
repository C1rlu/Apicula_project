extends Node


func _input(event):
	
	if event.is_action_pressed("open_selector"):
		_global_datas.open_tool_selector.emit(true)		
