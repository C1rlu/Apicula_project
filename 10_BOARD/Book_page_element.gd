extends Node

@export var focus_data : boardCamState_data
@export var all_photoData : Array[PhotoData]

var _index : int = 0


func _input(event):
	
	if _global_datas.camera_current_state != game_state.camera_state.Book:
		return

	if event.is_action_pressed("Select_next_orbre"):
		next_scanner()	
		
	if event.is_action_pressed("Select_previous_orbre"):
		previous_scanner()		
		
		
func next_scanner():
	
	_index += 1
	
	if _index ==  all_photoData.size():
		_index = 0
		
	print("next book")
	show_page()
	
func previous_scanner():
	
	_index -= 1
	
	if _index == -1:
		_index =  all_photoData.size()-1
		
	print("previous book")
	show_page()
	

func show_page():
	var selected_page = all_photoData[_index]
	selected_page.photo_element.show_this_on_book()
	_global_datas.camera_focus_update.emit(focus_data)
