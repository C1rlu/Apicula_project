extends Node


@export var Main_camera_data : boardCamState_data
@export var Board_camera_data : boardCamState_data

func _set_back_call():
	
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		_global_datas._add_back_call.emit(back_call_scanner)
		
	if _global_datas.camera_current_state == game_state.camera_state.Apicula:
		_global_datas._add_back_call.emit(back_call_apicula)	
		
	if _global_datas.camera_current_state == game_state.camera_state.Disque:
		_global_datas._add_back_call.emit(back_call_to_board)	
			
func back_call_scanner():
	
	_global_datas.camera_focus_On.emit(Board_camera_data)
	_global_datas.show_on_scanner_backdrop.emit(false)
		
func back_call_apicula():
	
	_global_datas.camera_focus_On.emit(Board_camera_data)

func back_call_to_board():
	
	_global_datas.camera_focus_On.emit(Board_camera_data)

