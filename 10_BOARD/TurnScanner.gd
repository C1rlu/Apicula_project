extends Node

@export var Cam_ref : Camera3D
@export var Cam_to_move : Camera3D
@export var Cam_to_move_scanner: Camera3D
@onready var loader = $"../../3D_SCENE/Loader"

var lock_action : bool = false

var no_zoom_pos : Vector3
var zoom_position : Vector3


func _ready():
	_set_zoom_pos()

func _process(delta):
	

	if !_global_datas.camera_current_state == _global_datas.camera_state.Scanner:
		return	
		
	if Input.is_action_pressed((_global_datas.move_right)):
	
		loader.rotation_degrees.y -=  100 * delta

	if Input.is_action_pressed((_global_datas.move_left)):
	
		loader.rotation_degrees.y +=  100 * delta
		

func _input(event):
	
	if !_global_datas.camera_current_state == _global_datas.camera_state.Scanner:
		return	
	
	if event.is_action_pressed((_global_datas.move_forward)):
		process_zoom_in()
			
	if event.is_action_released((_global_datas.move_forward)):
		process_zoom_out()


		
func process_zoom_in():
	
	
	lock_action = true
	
	var t
	t = create_tween()
	t.tween_property(Cam_to_move,"position",zoom_position,0.8).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var s
	s = create_tween()
	s.tween_property(Cam_to_move_scanner,"position",zoom_position,0.8).set_trans(Tween.TRANS_SINE)
	s.connect("finished",done)
	
func process_zoom_out():
	
	
	lock_action = true
	
	var t
	t = create_tween()
	t.tween_property(Cam_to_move,"position",no_zoom_pos,0.8).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var s
	s = create_tween()
	s.tween_property(Cam_to_move_scanner,"position",no_zoom_pos,0.8).set_trans(Tween.TRANS_SINE)
	s.connect("finished",done)
func done():
	lock_action = false	
			
func _set_zoom_pos():
	
	var dir = Cam_ref.get_camera_transform().basis.z
	var forward = -dir.normalized()

	no_zoom_pos = Cam_ref.position
	zoom_position = no_zoom_pos + forward * 0.09 #+ Vector3(0.0,0.0,-0.08)

