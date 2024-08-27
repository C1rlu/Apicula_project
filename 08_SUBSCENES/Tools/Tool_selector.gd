extends Node

@export var flash_tool : tool_data
@export var create_vortex : tool_data
@export var go_faster : tool_data
var lock_active_tool : bool = false

func _ready():
	
	_global_datas.open_tool_selector.connect(_lock)
	
func _lock(condition : bool):
	
	lock_active_tool = condition
	
	
func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return
	

	
	#if event.is_action_pressed("open_tool_selector"):	
		#_global_datas.open_tool_selector.emit(true)
		#lock_active_tool = true
	#
	#if event.is_action_released("open_tool_selector"):
		#_global_datas.open_tool_selector.emit(false)
		#lock_active_tool = false
	#
#
	#if lock_active_tool:
		#return	
		#
	if event.is_action_pressed("Active_tool"):
		_global_datas._selected_tool.tool_active_signal.emit(true)
	if event.is_action_released("Active_tool"):
		_global_datas._selected_tool.tool_active_signal.emit(false)
		

	if event.is_action_pressed("Flash"):
		flash_tool.tool_active_signal.emit(true)
		
	
	if event.is_action_pressed("go_faster"):
		go_faster.tool_active_signal.emit(true)
	if event.is_action_released("go_faster"):
		go_faster.tool_active_signal.emit(false)

	if event.is_action_pressed("Flash"):
		create_vortex.tool_active_signal.emit(true)
	if event.is_action_released("Flash"):
		create_vortex.tool_active_signal.emit(false)

