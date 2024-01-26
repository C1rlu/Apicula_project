extends Node

var smooth_speed = 3.0
var offset: Vector3
var active_target : Vector3

@export var _all_cam_array : Array[Camera3D]

var canMove = false

@export var basePos: Vector3

func _ready():
	var playerPosition = _global_datas.subbscene_playerPosition
	offset = self.transform.origin - playerPosition
	active_target = offset
	
	# global move
	_global_datas._start_ini_subscene.connect(cant_move)
	_global_datas._end_ini_subscene.connect(can_move)
	
	basePos = active_target 
	
	
func _physics_process(_delta):
	
	if !canMove:
		return
	var playerPosition = _global_datas.subbscene_playerPosition	
	for cam in _all_cam_array:
		cam.transform.origin = lerp(cam.transform.origin, playerPosition + active_target, smooth_speed * _delta)	

	

func can_move():
	canMove = true
	
	
func cant_move():
	canMove = false
	self.position = active_target 

