extends Node


@onready var loader = $"../../3D_SCENE/Loader"

func _process(delta):
	

	if !_global_datas.camera_current_state == _global_datas.camera_state.Scanner:
		return	
		
	if Input.is_action_pressed((_global_datas.move_right)):
	
		loader.rotation_degrees.y -=  100 * delta

	if Input.is_action_pressed((_global_datas.move_left)):
	
		loader.rotation_degrees.y +=  100 * delta
