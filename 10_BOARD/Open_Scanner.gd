extends Node

@export var first_scanner : PhotoData
func _on_on_click_on_click():
	
	_global_datas.selected_photoData = first_scanner
	_global_datas.show_on_scanner.emit(true)
	
	
