extends Node


func _on_button_pressed():
	_global_datas._active_sonar.emit()
