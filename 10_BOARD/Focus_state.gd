extends Node



@export var focus_data : boardCamState_data

func _on_on_click_on_click():
	if focus_data:
		_global_datas.camera_focus_On.emit(true,focus_data)
		_global_datas._add_back_call.emit(add_back_call)	
	
func add_back_call():
	
	if _global_datas.camera_current_state == _global_datas.camera_state.Scanner:
		_global_datas.show_on_scanner_backdrop.emit(false)
		
	_global_datas.camera_focus_On.emit(false,null)
	_global_datas.book_back_idle_position.emit(false)
	
	
