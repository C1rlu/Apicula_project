extends Node


@export var Cam : Camera3D

var previous_position : Vector3
var previous_rotation : Vector3

func _ready():
	_global_datas.camera_focus_On.connect(focus)
	
	
func focus(condition : bool, focus_data : boardCamState_data):
	
	if !condition:
		
		_global_datas.camera_is_moving = true
		var tt
		tt = create_tween()
		tt.tween_property(Cam,"position",previous_position,0.8)
		tt.connect("finished",done)	
		var rr
		rr = create_tween()
		rr.tween_property(Cam,"rotation_degrees",previous_rotation,0.8)
		print("BACK TO POSITION")
		return	
	
	
	previous_position = focus_data.camera_position_node.position	
	var t
	t = create_tween()
	t.tween_property(Cam,"position",focus_data.camera_position_node.position,0.8)
	t.connect("finished",done)	
	
	previous_rotation = focus_data.camera_position_node.rotation_degrees
	var r
	r = create_tween()
	r.tween_property(Cam,"rotation_degrees",focus_data.camera_position_node.rotation_degrees,0.8)




func done():
	_global_datas.camera_is_moving = false
