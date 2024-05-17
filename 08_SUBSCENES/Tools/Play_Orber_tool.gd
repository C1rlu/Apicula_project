extends Node


@export var tool_type: tool_data
@export var tool_type_back: tool_data

var active : bool = true
func _ready():
	
	if !active:
		return
		
	_global_datas._backFrom_subscene.connect(disable)
	_global_datas.switching_tool.connect(switch_active_main_input)	
	
func switch_active_main_input(a_tool_type : tool_data):
	tool_type = a_tool_type

func disable():
	tool_type.tool_active_signal.emit(false)
	
	
func _input(event):
	
	if !active:
		return
	
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
		_global_datas.switching_tool.emit(tool_type)
