extends Area3D

var can_click = false

func _input(event: InputEvent) -> void:
	
	if _global_datas.Npc_Dialogue != null:
		return
	if _global_datas.Player_InBoard:
		return
	if _global_datas.Player_InMenu:
		return		
	if !can_click:
		return
	if _global_datas.Player_InSubScene:
		return
			
	if event.is_action_pressed("Click"):
		_global_datas._active_sonar.emit()
		

func _on_mouse_entered():
	print("Mouse enter")
	can_click = true
	_global_datas.Cursor_mode.cursor_in()
	_global_datas.Player_lock_click = true
func _on_mouse_exited():
	print("Mouse exit")
	can_click = false
	_global_datas.Cursor_mode.cursor_out()
	_global_datas.Player_lock_click = false
