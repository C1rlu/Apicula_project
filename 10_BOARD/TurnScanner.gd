extends Node

var t 
var rotating : bool	


func _input(event):
	
	if _global_datas.camera_current_state != game_state.camera_state.Scanner:
		return	
	
	if Input.is_action_pressed("next_right"):
		_on_rotate(1)	
		
	if Input.is_action_pressed("next_left"):
		_on_rotate(-1)	
		
func _on_rotate(direction):	

	if t:
		t.kill()
		
	if direction == 1:
		var target_rotation = _global_datas.scanner_root.rotation_degrees.y + 45
		rotating = true
		t = create_tween()
		t.tween_property(_global_datas.scanner_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
	if direction == -1:
		var target_rotation = _global_datas.scanner_root.rotation_degrees.y - 45
		rotating = true
		t = create_tween()
		t.tween_property(_global_datas.scanner_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		
func done():
	rotating = false
	

	
