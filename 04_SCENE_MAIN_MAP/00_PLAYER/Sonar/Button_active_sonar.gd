extends Node


var disable = true 
func _input(event):
	
	#if disable:
		#return
	
	if _global_datas.Player_In_Inventory:
		return	
	if _global_datas.Player_InSubScene:
		return
	if _global_datas.Player_InMenu:
		return	
	if _global_datas.Player_InDialogue:
		return	

	if event.is_action_pressed("Push_to_subscene"):
		
		var boat_position = _global_datas.player_position
		_global_datas._active_sonar.emit(boat_position)		
		_global_datas._show_zone_info.emit(true)
