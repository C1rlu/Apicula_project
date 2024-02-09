extends Node3D

@export var move_speed: float = 5.0
var speed
@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0

	
func _process(delta):
	
	if !_global_datas.Player_In_Inventory:
		return
	if _global_datas.Player_lock_click:
		return	

	if _global_datas.zoom_value == 42:
		speed = move_speed
	if _global_datas.zoom_value == 22:
		speed = move_speed/2
	if _global_datas.zoom_value == 5:
		speed = move_speed / 3
	var camera_position = position
	
	if Input.is_action_pressed(("move_right")):
		camera_position.x += speed * delta
	if Input.is_action_pressed(("move_left")):
		camera_position.x -= speed * delta	
	if Input.is_action_pressed(("move_forward")):
		camera_position.z -= speed * delta
	if Input.is_action_pressed(("move_backward")):
		camera_position.z += speed * delta
	
	var lerp_value = (_global_datas.zoom_value - 22.0) / (42.0 - 22.0)	
	var oneminus = lerp(1.0,0.0,lerp_value)
	
	camera_position.x = clamp(camera_position.x, oneminus * min_x, oneminus * max_x)
	camera_position.z = clamp(camera_position.z, oneminus * min_z, oneminus * max_z)	
	

	position = camera_position
	
	