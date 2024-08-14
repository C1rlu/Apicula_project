extends Node

var lock_active_tool : bool = false

func _ready():
	
	_global_datas.open_tool_selector.connect(_lock)
	
func _lock(condition : bool):
	
	lock_active_tool = condition
	
	
	
func back_call():
	_global_datas.open_tool_selector.emit(false)	
func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return
	
	if lock_active_tool:
		return
	
	if event.is_action_pressed("open_tool_selector"):	
		_global_datas.open_tool_selector.emit(true)
		_global_datas._add_back_call.emit(back_call)	
		#lock_active_tool = true
	
	#if event.is_action_released("open_tool_selector"):
		#_global_datas.open_tool_selector.emit(false)
		#lock_active_tool = false
	
	

		
		
	if event.is_action_pressed("Active_tool"):
		_global_datas._selected_tool.tool_active_signal.emit(true)
		
	if event.is_action_released("Active_tool"):

		_global_datas._selected_tool.tool_active_signal.emit(false)
		

