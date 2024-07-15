extends Node

var smooth_speed = 3.0
var offset: Vector3
var active_target : Vector3

@export var _all_cam_array : Array[Camera3D]

var canMove = false

@export var basePos: Vector3
var subscene_reset_position : Vector3
func _ready():
	var playerPosition = _global_datas.subbscene_playerPosition
	offset = _all_cam_array[0].transform.origin - playerPosition
	active_target = offset + basePos
	subscene_reset_position = _all_cam_array[0].transform.origin
	# global move
	_global_datas._go_Subscene.connect(can_move)

	_global_datas.Subscene_Camera = _all_cam_array[0]
	
	
	
func _physics_process(_delta):
	
	if !canMove:
		return
		
	var playerPosition = _global_datas.subbscene_playerPosition	
	
	for cam in _all_cam_array:
		cam.transform.origin = lerp(cam.transform.origin, playerPosition +  active_target, smooth_speed * _delta)	

	
func  reset_position():

	for cam in _all_cam_array:
		cam.transform.origin = subscene_reset_position
		

func can_move():
	canMove = true
	reset_position()
	
func cant_move():
	canMove = false


