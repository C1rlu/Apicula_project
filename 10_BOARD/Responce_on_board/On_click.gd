extends Node

signal On_click


func _on_on_click():
	_global_datas.responce_chose.emit("MY RESPONCE CHOICE")	
