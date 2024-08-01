extends Node


func _on_on_click_on_click():

	_global_datas.show_on_scanner_backdrop.emit(true)



func _on_on_over_on_over_signal(condition):
	_global_datas.show_on_scanner.emit(condition)
	print("SHOW SCANNER")
