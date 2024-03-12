extends Node

func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
	if event.is_action_pressed("Click"):
		_global_datas._selected_tool.tool_active_signal.emit(true)
		
	if event.is_action_released("Click"):
		_global_datas._selected_tool.tool_active_signal.emit(false)
