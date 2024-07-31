extends Node

@export var all_Cam : Array[Camera3D]

var is_active : bool = false
@export var previous_focus : boardCamState_data
func _ready():
	_global_datas.camera_focus_On.connect(_focus)
	_global_datas.camera_focus_update.connect(update_focus)

# for book update position for example
func update_focus(focus_data : boardCamState_data):
	
	for c in all_Cam:
		cam_to_state(c,focus_data)	

func _focus(focus_data : boardCamState_data):
	
	for c in all_Cam:
		cam_to_state(c,focus_data)	

	_global_datas.camera_current_state = focus_data.cam_state
		
	_global_datas._add_back_call.emit(back_call)

func back_call():
	
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		_global_datas.show_on_scanner_backdrop.emit(false)
		
	_global_datas.book_back_idle_position.emit(false)
	
	for c in all_Cam:
		cam_to_state(c,previous_focus)	
	
	_global_datas.camera_current_state = previous_focus.cam_state
		
func cam_to_state(cam,focus):
		cam.current = true 
	
		var t
		t = create_tween()
		t.tween_property(cam,"global_position",focus.camera_position_node.global_position,0.8).set_trans(Tween.TRANS_SINE)
		#t.connect("finished",done_state_to_main)	
		var r
		r = create_tween()
		r.tween_property(cam,"rotation_degrees",focus.camera_position_node.global_rotation_degrees,0.8).set_trans(Tween.TRANS_SINE)	


func done_state_to_main():

	_global_datas.camera_current_state = game_state.camera_state.Main


