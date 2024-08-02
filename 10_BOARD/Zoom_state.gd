extends Node

@export var main_state : boardCamState_data
@export var board_state : boardCamState_data
@export var board_zoom_state : boardCamState_data

func _input(event):
	
	
	if !_global_datas.Player_In_Inventory:
		return
		
	if event.is_action_pressed("Board_zoom_in"):
		zoom_in()
			
	if event.is_action_pressed("Board_zoom_out"):
		zoom_out()
		
		
func zoom_in():
	
	if _global_datas.camera_current_state == game_state.camera_state.Main:
		_global_datas.camera_focus_On.emit(board_state)	
		return
		
	if _global_datas.camera_current_state == game_state.camera_state.Board:
		_global_datas.camera_focus_On.emit(board_zoom_state)	
		return	
func zoom_out():
	
	if _global_datas.camera_current_state == game_state.camera_state.Board:
		_global_datas.camera_focus_On.emit(main_state)	
		return	
		
	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		_global_datas.camera_focus_On.emit(board_state)
		_global_datas.book_back_idle_position.emit(false)	
		return
