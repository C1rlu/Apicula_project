extends Node


func _ready():
	
	_global_datas._backFrom_subscene.connect(disable)

func disable():
	_global_datas._selected_tool.tool_active_signal.emit(false)
	

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
		

