extends Node

var smooth_speed = 3.0
var offset: Vector3
var sub_scene_offset: Vector3
var dialogue_offset: Vector3
var active_target : Vector3
var menu_scene_offset: Vector3


@export var _all_cam_array : Array[Camera3D]


func _ready():
	
	sub_scene_offset = Vector3(0.0,-3.125,0.0)
	dialogue_offset =  Vector3(-3.0,0.0,-2.5)
	menu_scene_offset = Vector3(0.0,-2.5,0.0)
	
	var playerPosition = _global_datas.player_position
	offset = _all_cam_array[0].transform.origin - playerPosition
	active_target = offset
	
	
	_subscene_datas.go_subscene.connect(_inSubScene_states)

	
	_global_datas._open_dialogue.connect(_inDialogue)
	_global_datas._close_dialogue.connect(_outDialogue)
	
func _physics_process(_delta):
	
	
	var playerPosition = _global_datas.player_position
	for cam in _all_cam_array:
		cam.transform.origin = lerp(cam.transform.origin, playerPosition + active_target, smooth_speed * _delta)	

func _inSubScene_states(condition : bool):
	
	if condition:	
		
		active_target = offset + sub_scene_offset
	else:
		active_target = offset		


func _inDialogue():
	active_target = offset + dialogue_offset
	
func _outDialogue():
	active_target = offset
	
