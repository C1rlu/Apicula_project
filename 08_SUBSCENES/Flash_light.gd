extends Node


@export var flash_light_tool : tool_data

func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	if event.is_action_pressed("flash"):
		flash_light_tool.tool_active_signal.emit(true)	
