extends Node

@export var focusState : boardCamState_data

func _on_on_click_on_click():
	_global_datas.select_boardFocus.emit(focusState)
	
	
	add_back_call()
	
	
func add_back_call():
	
	_global_datas._add_back_call.emit(back_call)
	
func back_call():
	var previous_state = focusState.back_state
	if previous_state:
		_global_datas.select_boardFocus.emit(previous_state)	
		_global_datas.book_back_idle_position.emit(false)	
