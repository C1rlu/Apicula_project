extends Node


@export var Cam_state : Camera3D
@export var Cam_main : Camera3D


func _ready():
	_global_datas.camera_focus_On.connect(focus)
	
	
func focus(condition : bool, focus_data : boardCamState_data):
	

	if !condition:
		
		
		
		var tt
		tt = create_tween()
		tt.tween_property(Cam_state,"global_position",Cam_main.global_position,0.8).set_trans(Tween.TRANS_SINE)
		tt.connect("finished",done_state_to_main)	
		var rr
		rr = create_tween()
		rr.tween_property(Cam_state,"rotation_degrees",Cam_main.global_rotation_degrees,0.8).set_trans(Tween.TRANS_SINE)
		

	else:
		
		_global_datas.camera_current_state = _global_datas.camera_state.Apicula
		
		Cam_state.global_position = Cam_main.global_position
		Cam_state.rotation_degrees = Cam_main.global_rotation_degrees
		
		Cam_state.current = true
		Cam_main.current = false
		
		var t
		t = create_tween()
		t.tween_property(Cam_state,"global_position",focus_data.camera_position_node.global_position,0.8).set_trans(Tween.TRANS_SINE)
		#t.connect("finished",done)	

		var r
		r = create_tween()
		r.tween_property(Cam_state,"rotation_degrees",focus_data.camera_position_node.global_rotation_degrees,0.8).set_trans(Tween.TRANS_SINE)




func done_state_to_main():
	Cam_main.current = true
	Cam_state.current = false
	
	_global_datas.camera_current_state = _global_datas.camera_state.Main
	print("BACK TO POSITION")
