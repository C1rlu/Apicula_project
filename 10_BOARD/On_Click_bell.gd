extends Node


signal On_click



func _on_on_click():

	_global_datas.send_bird_responce.emit()
		
