extends Node3D

@export var move_speed: float = 5.0

@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0

	
func _process(delta):
	
	if !_global_datas.Player_In_Inventory:
		return
		
	var camera_position = position
	
	if Input.is_action_pressed(("move_right")):
		camera_position.x += move_speed * delta
	if Input.is_action_pressed(("move_left")):
		camera_position.x -= move_speed * delta	
	if Input.is_action_pressed(("move_forward")):
		camera_position.z -= move_speed * delta
	if Input.is_action_pressed(("move_backward")):
		camera_position.z += move_speed * delta
	
	var lerp_value = (_global_datas.zoom_value - 22.0) / (42.0 - 22.0)	
	var oneminus = lerp(1.0,0.0,lerp_value)

	camera_position.x = clamp(camera_position.x, oneminus * min_x, oneminus * max_x)
	camera_position.z = clamp(camera_position.z, oneminus * min_z, oneminus * max_z)	
	

	position = camera_position
	
	
