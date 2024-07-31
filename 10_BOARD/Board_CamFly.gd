extends Node

@export var all_cam : Array[Camera3D]
@export var focus_target : Node3D
@onready var camera_on_board = $"../../3D_SCENE/Camera_state/Camera_OnBoard"

var smooth_speed = 3.0
var speed : float = 1

var offset : Vector3
var target_position : Vector3

func _ready():
	offset = camera_on_board.global_position - focus_target.global_position	
	
	
func _process(delta):
	
	if _global_datas.camera_current_state != game_state.camera_state.Board:
		return
		

	for c in all_cam:
		c.global_position = lerp(c.global_position, focus_target.global_position + offset, smooth_speed * delta)	
		#rotation_angle(c,delta)
		#
#func rotation_angle(cam,delta):
#
	#var angle_target = focus_target.global_position.x
	#
	#var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	#var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	#var target_angle = lerp(-0.3, 0.3, t)
	#var rotation_target = Vector3(cam.global_rotation.x,-target_angle,cam.global_rotation.z)
	#cam.global_rotation = lerp(cam.global_rotation, rotation_target, smooth_speed * delta)
