extends Node




signal Restart

func _restart():
	_global_datas.boue_archives.clear()
	_global_datas.photo_archives.clear()
	_global_datas.note_archives.clear()
	
func _on_restart_button_pressed():
	Restart.emit()
	
	_restart()
	get_tree().reload_current_scene()
	
