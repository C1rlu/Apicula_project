extends Node


@export var tool_selector : tool_data

func _input(event):
	

	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return

	if event.is_action_pressed("Active_tool"):
		_global_datas._selected_tool.tool_active_signal.emit(true)
		
	if event.is_action_released("Active_tool"):

		_global_datas._selected_tool.tool_active_signal.emit(false)
		
	if event.is_action_pressed("open_tool_selector"):
		_global_datas.open_tool_selector.emit(true)
	
