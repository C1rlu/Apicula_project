extends Node


@export var light_tool: tool_data

@export var Fusion_tool : tool_data


var active : bool = true
func _ready():
	
	if !active:
		return
		
	_global_datas._backFrom_subscene.connect(disable)
	#_global_datas.switching_tool.connect(switch_active_main_input)	
	
func switch_active_main_input(a_light_tool : tool_data):
	light_tool = a_light_tool

func disable():
	light_tool.tool_active_signal.emit(false)
	
	
func _input(event):
	
	if !active:
		return
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return
	
	
	if event.is_action_pressed("Fusion"):
		_global_datas.switching_tool.emit(Fusion_tool)
		Fusion_tool.tool_active_signal.emit(true)
	
	if event.is_action_released("Fusion"):
		Fusion_tool.tool_active_signal.emit(false)
		_global_datas.switching_tool.emit(light_tool)
	
	#if event.is_action_pressed("Flash_light"):
		##_global_datas.switching_tool.emit(light_tool)
		#light_tool.tool_active_signal.emit(true)
		#
	#if event.is_action_released("Flash_light"):
		#light_tool.tool_active_signal.emit(false)
		#_global_datas.switching_tool.emit(light_tool)
