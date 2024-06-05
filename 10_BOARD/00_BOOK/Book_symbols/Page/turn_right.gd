extends Button


func _on_pressed():
	print("PRESSED")
	_global_datas.turn_right.emit()
