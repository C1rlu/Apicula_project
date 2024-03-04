extends Node

func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMirrorScene:
		return
	
	if _global_datas.teleporter_amount == 3:
		return
			
	if event.is_action_pressed("Add_teleporter"):
		_global_datas._instance_teleporter.emit()
			


