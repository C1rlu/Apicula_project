extends Node

@export var focusState : boardCamState_data
func _on_on_click_on_click():
	_global_datas.select_boardFocus.emit(focusState)
	
