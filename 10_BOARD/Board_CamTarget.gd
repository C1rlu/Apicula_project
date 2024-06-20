extends Node3D

@export var move_speed: float = 5.0
var speed
@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0
var border_ratio : float = 42

var target_position : Vector3

func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)


func _process(delta):
	
	if _global_datas.Player_InMenu:
		return
	
	if !_global_datas.Player_In_Inventory:
		return

		
	if _global_datas.in_scanner_mode:
		return
	
	if _global_datas.in_text_type_mod:
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

	if _global_datas.zoom_value == 1:
		var _lerp_value = (border_ratio - 22.0) / (42.0 - 22.0)	
		var _oneminus = lerp(1.0,0.0,_lerp_value)
		target_position.x = clamp(target_position.x, _oneminus * min_x, _oneminus * max_x)
		target_position.z = clamp(target_position.z, _oneminus * min_z, _oneminus * max_z)
		position = lerp(camera_position,target_position,speed * 5 *delta)	
		return
		
	
	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		target_position.x += _magnitude * speed * delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		target_position.x -= _magnitude * speed * delta	
	if Input.is_action_pressed(_global_datas.move_forward):
		var _magnitude = Input.get_action_strength(_global_datas.move_forward)
		target_position.z -= _magnitude * speed * delta	
	if Input.is_action_pressed(_global_datas.move_backward):
		var _magnitude = Input.get_action_strength(_global_datas.move_backward)
		target_position.z += _magnitude * speed * delta
	
	var lerp_value = (border_ratio - 22.0) / (42.0 - 22.0)	
	var oneminus = lerp(1.0,0.0,lerp_value)
	
	target_position.x = clamp(target_position.x, oneminus * min_x, oneminus * max_x)
	target_position.z = clamp(target_position.z, oneminus * min_z, oneminus * max_z)
		
	position = target_position
	
func _focus_this(_position):

	target_position = _position 


