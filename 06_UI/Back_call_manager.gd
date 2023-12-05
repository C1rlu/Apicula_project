extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Back_call"):
		_global_datas._call_back.emit()


	
	
