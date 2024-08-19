extends Camera3D

@onready var focus_target = $"../CamTarget"

var offset : Vector3
var offset_rotation : Vector3


var target_camera

func _ready():
	
	offset = global_position - focus_target.global_position	
	offset_rotation = rotation_degrees




func _process(delta):
	
	rotation_angle(delta)	
	
	global_position  = lerp(global_position, focus_target.global_position	+ offset, 3.0 * delta)	
	rotation_degrees = lerp(rotation_degrees, offset_rotation + focus_target.rotation_degrees, 3.0 * delta)	
	


func rotation_angle(delta):

	var angle_target = focus_target.global_position.x
	
	var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	var target_angle = lerp(-10, 10, t)
	var rotation_target = Vector3(0.0, -target_angle,0.0)
	focus_target.rotation_degrees = rotation_target
