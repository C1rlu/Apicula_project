extends Node



func _input(event):
	
	if event.is_action_pressed("Flash_light"):
		
		var boat_position = _global_datas.player_position
		_global_datas._active_sonar.emit(boat_position)		
