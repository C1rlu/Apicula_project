extends Node


@export var tool_type: tool_data

func _ready():
	
	_global_datas._backFrom_subscene.connect(disable)

func disable():
	tool_type.tool_active_signal.emit(false)
	
	
func _input(event):
	
	
	
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return
	
	
	if event.is_action_pressed("Click"):
		_global_datas.switching_tool.emit(tool_type)
		tool_type.tool_active_signal.emit(true)
		
	if event.is_action_released("Click"):
		tool_type.tool_active_signal.emit(false)
