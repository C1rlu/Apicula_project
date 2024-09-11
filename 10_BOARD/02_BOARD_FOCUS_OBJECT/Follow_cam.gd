extends Node


@export var _Camera : Camera3D
@export var _target : Node3D
@export var smooth_speed = 3.0
@export var Render : TextureRect

var focus_target : Vector3
var target_rotation : Vector3
var offset : Vector3

func _ready():
	offset = _Camera.transform.origin - _target.position 
	target_rotation = _Camera.rotation_degrees

func _process(delta):

	if !Render.visible:
		return
	_Camera.transform.origin = lerp(_Camera.transform.origin,_target.position + offset, smooth_speed * delta)	
	#rotation_angle(delta)
	#_Camera.rotation_degrees = lerp(_Camera.rotation_degrees, target_rotation + _target.rotation_degrees, 3.0 * delta)	
#func rotation_angle(delta):
#
	#var angle_target = _target.global_position.x
	#var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	#var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	#var target_angle = lerp(-20, 20, t)
	###y
	#var angle_target_y = _target.global_position.y
	#var angle_target_clamp_y = clampf(angle_target,-0.5,0.5)
	#var t_y = (angle_target_clamp_y - -0.5) / ( 0.5 -- 0.5)
	#var target_angle_y = lerp(-20, 20, t_y)
#
	#var rotation_target = Vector3(-target_angle_y, 0.0,0.0)
	#
	#_target.rotation_degrees = rotation_target
	#
	###for offset correction here
	##var target_offset_x = lerp(-0.125,0.125, t)
	##var target_offset_y = lerp(-0.05,0.05, t)
	##offset_rotation = Vector3(-target_offset_x, target_offset_y,0.0)
