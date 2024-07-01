extends Node


signal On_click



func _on_on_click():
		
	if _global_datas.Player_InSubScene:
		return
	
	if _global_datas.link_mode:
		return
		
	if !_global_datas.active_queste.done:
		return
		
	_global_datas.send_bird_responce.emit()
		
