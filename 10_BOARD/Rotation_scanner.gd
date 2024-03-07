extends Node

@onready var loader = $"../../InsidePhoto_scanner_scene/loader"


func _ready():
	_global_datas.show_subscene_scanner.connect(_turn_on_pose)
	


func _turn_on_pose():
	
	loader.rotation.y = 60
	
	
func _process(delta):
	
	if _global_datas.Player_InSubScene:
		return

	if !_global_datas.in_scanner_mode:
		return

	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		loader.rotation.y += _magnitude * 5 * delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		loader.rotation.y -= _magnitude * 5 * delta
