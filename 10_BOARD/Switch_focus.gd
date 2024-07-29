extends Node

@export var all_focus : Array[boardCamState_data]
var active_state : int = 0

var lock_action : bool = false
var active : bool = false
func _input(event):
	
	if !active:
		return
	
	if !_global_datas.Player_In_Inventory:
		return
	
	if lock_action:
		return
		
	if event.is_action_pressed("move_right"):

		next_update_index()
	if event.is_action_pressed("move_left"):

		previous_update_index()

func next_update_index():
	
	_global_datas.open_info_book.emit(false)
	active_state += 1
	if active_state == all_focus.size():
		active_state = 0
		
	print(active_state)
	_global_datas.select_boardFocus.emit(all_focus[active_state])

func previous_update_index():
	
	_global_datas.open_info_book.emit(false)
	active_state -= 1
	if active_state == -1:
		active_state = all_focus.size()-1
		
	print(active_state)
	_global_datas.select_boardFocus.emit(all_focus[active_state])



func _on_camera_focus__lock_action(condition):
	lock_action = condition
