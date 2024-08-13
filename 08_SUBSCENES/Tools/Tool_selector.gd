extends Node


@export var jet_accelerator : tool_data
var previous_tool : tool_data

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
	
	if event.is_action_released("open_tool_selector"):
		_global_datas.open_tool_selector.emit(false)
	
	if event.is_action_pressed("Speed_boat"):

		previous_tool = _global_datas._selected_tool 
		_global_datas.set_tool_ui.emit(jet_accelerator)
		jet_accelerator.tool_active_signal.emit(true)
		
	if event.is_action_released("Speed_boat"):
		jet_accelerator.tool_active_signal.emit(false)
		_global_datas.set_tool_ui.emit(previous_tool)
