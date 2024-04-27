extends Node3D

@export var move_speed: float = 5.0
var speed
@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0
var border_ratio : float = 42


func _process(delta):
	
	if _global_datas.Player_InMenu:
		return
	
	if !_global_datas.Player_In_Inventory:
		return


	if _global_datas.in_scanner_mode:
		return
	
	if _global_datas.zoom_value == 1:
		speed = move_speed
		border_ratio = 42
	if _global_datas.zoom_value == 2:
		speed = move_speed/1.8
		border_ratio = 22
	if _global_datas.zoom_value == 3:
		speed = move_speed / 4
		border_ratio = 5
	var camera_position = position
	
	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		camera_position.x += _magnitude * speed * delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		camera_position.x -= _magnitude * speed * delta	
	if Input.is_action_pressed(_global_datas.move_forward):
		var _magnitude = Input.get_action_strength(_global_datas.move_forward)
		camera_position.z -= _magnitude * speed * delta	
	if Input.is_action_pressed(_global_datas.move_backward):
		var _magnitude = Input.get_action_strength(_global_datas.move_backward)
		camera_position.z += _magnitude * speed * delta
	
	var lerp_value = (border_ratio - 22.0) / (42.0 - 22.0)	
	var oneminus = lerp(1.0,0.0,lerp_value)
	
	camera_position.x = clamp(camera_position.x, oneminus * min_x, oneminus * max_x)
	camera_position.z = clamp(camera_position.z, oneminus * min_z, oneminus * max_z)	
	

	position = camera_position
	
