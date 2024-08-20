extends Node


@export var all_scanner : Array[PhotoData]

var _index : int = 0


func _input(event):
	
	#if _global_datas.camera_current_state != game_state.camera_state.Scanner:
		#return
	pass
	#if event.is_action_pressed("Select_next_orbre"):
		#next_scanner()	
		#
	#if event.is_action_pressed("Select_previous_orbre"):
		#previous_scanner()		
		#
		
func next_scanner():
	
	_index += 1
	
	if _index == all_scanner.size():
		_index = 0
		
	_global_datas.selected_photoData = all_scanner[_index]
	_global_datas.show_on_scanner.emit(true)


func previous_scanner():
	
	_index -= 1
	
	if _index == -1:
		_index = all_scanner.size()-1
		
	_global_datas.selected_photoData = all_scanner[_index]
	_global_datas.show_on_scanner.emit(true)


