extends Node


@export var Second_action_tool : tool_data

func _input(event):
		
	if !_global_datas.Player_InSubScene:
		return
		
		
	if event.is_action_pressed("Flash_light"):
		Second_action_tool.tool_active_signal.emit(true)	
	
	if event.is_action_released("Flash_light"):
		Second_action_tool.tool_active_signal.emit(false)	
		
