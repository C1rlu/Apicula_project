extends Node

@export var tool_type: tool_data
@export var tool_type_back: tool_data
func _ready():
	
	_global_datas._backFrom_subscene.connect(disable)

func disable():
	tool_type.tool_active_signal.emit(false)
	
	
func _input(event):
	
	if _global_datas.Player_In_Inventory:
		return
		
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
	if event.is_action_pressed("Scanning"):
		_global_datas.switching_tool.emit(tool_type)
		tool_type.tool_active_signal.emit(true)
		
	if event.is_action_released("Scanning"):
		tool_type.tool_active_signal.emit(false)
		_global_datas.switching_tool.emit(tool_type_back)
