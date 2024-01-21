extends Area3D

var can_click = false
@onready var on_over_mouse_3d_shape = $"../Sonar/On_OverMouse_3D_SHAPE"

func _input(event: InputEvent) -> void:
	


	if !can_click:
		return
	if _global_datas.Player_InSubScene:
		return
			
	if event.is_action_pressed("Click"):
		if _global_datas.Player_InDialogue:
			_global_datas._close_dialogue.emit()	
		
		if _global_datas.Player_InBoard:
			return		
		_global_datas._active_sonar.emit()
		

func _on_mouse_entered():
	
	if _global_datas.Player_InBoard:
		return
	if _global_datas.Player_InDialogue_zone:
		return
	
	if _global_datas.Player_lock_click:
		return
		
	if _global_datas.Player_InSubScene:
		return
		
	can_click = true
	_global_datas.Cursor_mode.cursor_in()
	_global_datas.Player_lock_click = true
	on_over_mouse_3d_shape.visible = true
	
func _on_mouse_exited():
	
	can_click = false
	_global_datas.Cursor_mode.cursor_out()
	_global_datas.Player_lock_click = false
	on_over_mouse_3d_shape.visible = false
