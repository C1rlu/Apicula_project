extends Node

@export var Cam_main : Camera3D
@export var Cam_scanner_main : Camera3D 



@export var Cam_state : Camera3D
@export var Cam_scanner_state : Camera3D

var is_active : bool = false

func _ready():
	_global_datas.camera_focus_On.connect(_focus)
	_global_datas.camera_focus_update.connect(update_focus)

# for book update position for example
func update_focus(focus_data : boardCamState_data):
	
	cam_to_state(Cam_state,focus_data)
	cam_to_state(Cam_scanner_state,focus_data)

func _focus(condition : bool, focus_data : boardCamState_data):
	
	if !condition:
		
		
		Cam_scanner_main.global_position = Cam_main.global_position
		Cam_scanner_main.rotation_degrees = Cam_main.global_rotation_degrees
			
	
		state_to_cam(Cam_state)
		state_to_cam(Cam_scanner_state)
		
	else:
		
		_global_datas.camera_current_state = focus_data.cam_state
		
		align_cam()
		
		cam_to_state(Cam_state,focus_data)
		cam_to_state(Cam_scanner_state,focus_data)

func align_cam():
	
	Cam_state.global_position = Cam_main.global_position
	Cam_state.rotation_degrees = Cam_main.global_rotation_degrees
		
	Cam_scanner_state.global_position = Cam_main.global_position
	Cam_scanner_state.rotation_degrees = Cam_main.global_rotation_degrees
		
	Cam_scanner_main.global_position = Cam_main.global_position
	Cam_scanner_main.rotation_degrees = Cam_main.global_rotation_degrees	
		
func cam_to_state(cam,focus):
		cam.current = true 
	
		var t
		t = create_tween()
		t.tween_property(cam,"global_position",focus.camera_position_node.global_position,0.8).set_trans(Tween.TRANS_SINE)
		
		var r
		r = create_tween()
		r.tween_property(cam,"rotation_degrees",focus.camera_position_node.global_rotation_degrees,0.8).set_trans(Tween.TRANS_SINE)	

func state_to_cam(cam):
		
		var tt
		tt = create_tween()
		tt.tween_property(cam,"global_position",Cam_main.global_position,0.8).set_trans(Tween.TRANS_SINE)
		tt.connect("finished",done_state_to_main)	
		var rr
		rr = create_tween()
		rr.tween_property(cam,"rotation_degrees",Cam_main.global_rotation_degrees,0.8).set_trans(Tween.TRANS_SINE)	

func done_state_to_main():
	
	Cam_main.current = true
	Cam_scanner_main.current = true

	
	_global_datas.camera_current_state = game_state.camera_state.Main
	#print("BACK TO POSITION")
	is_active = false
