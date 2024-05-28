extends Node

@export var clamp_cam_x : Vector2
@export var clamp_cam_z : Vector2
@export var _all_cam_array : Array[Node3D]
@export var _speed : float = 5.0
@export var smooth_speed : float = 5.0
var cam_target : Vector3

var offset : Vector3

func _ready():
	offset = _all_cam_array[0].global_position - cam_target

func _process(delta):
	_move_cam(delta)	

func _move_cam(_delta):
	
	if !_global_datas.in_scanner_mode:
		return
		
	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		cam_target.x += _magnitude *_speed * _delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		cam_target.x -= _magnitude * _speed * _delta	
	if Input.is_action_pressed(_global_datas.move_forward):
		var _magnitude = Input.get_action_strength(_global_datas.move_forward)
		cam_target.z -= _magnitude * _speed * _delta	
	if Input.is_action_pressed(_global_datas.move_backward):
		var _magnitude = Input.get_action_strength(_global_datas.move_backward)
		cam_target.z += _magnitude * _speed * _delta
	
	cam_target.x = clamp(cam_target.x, clamp_cam_x.x, clamp_cam_x.y)
	cam_target.z = clamp(cam_target.z, clamp_cam_z.x, clamp_cam_z.y)

	for cam in _all_cam_array:
		cam.global_position = lerp(cam.global_position, cam_target + offset, smooth_speed * _delta)	
