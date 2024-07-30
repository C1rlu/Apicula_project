extends Node

@export var scanner_data : PhotoData

func _on_on_click_on_click():
	_global_datas.selected_photoData = scanner_data
	_global_datas.show_on_scanner_backdrop.emit(true)
	_global_datas.camera_current_state = _global_datas.camera_state.Scanner
