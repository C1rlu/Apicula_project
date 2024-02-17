extends Node

@onready var loader = $"../../InsidePhoto_scanner_scene/loader"


func _process(delta):
	
	if !_global_datas.in_scanner_mode:
		return

	if Input.is_action_pressed((_global_datas.move_right)):
		loader.rotation.y += 5 * delta
	if Input.is_action_pressed((_global_datas.move_left)):
		loader.rotation.y -= 5 * delta
