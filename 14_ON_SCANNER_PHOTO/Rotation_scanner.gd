extends Node

@onready var loader = $"../../InsidePhoto_scanner_scene/loader"

@export var disable_rotations : bool = true
	
func _process(delta):
	
	
	if disable_rotations:
		return 
		
	if !_global_datas.in_scanner_mode:
		return

	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		loader.rotation.y += _magnitude * 5 * delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		loader.rotation.y -= _magnitude * 5 * delta
