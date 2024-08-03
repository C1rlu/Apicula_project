extends Node




func _set_state_call():
	
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		#_global_datas.show_on_scanner.emit(true)
		_global_datas.show_on_scanner_backdrop.emit(true)	
		
	if _global_datas.camera_current_state == game_state.camera_state.Apicula:
		pass	
