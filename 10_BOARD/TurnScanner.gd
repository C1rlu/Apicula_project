extends Node

@export var Cam_ref_scanner : boardCamState_data
@export var Cam_ref_Book : boardCamState_data

@export var Cam_to_move : Camera3D
@export var Cam_to_move_scanner: Camera3D
@onready var loader = $"../../3D_SCENE/Loader"

var lock_action : bool = false

var no_zoom_pos : Vector3
var zoom_position : Vector3


func _ready():

	_global_datas.camera_focus_On.connect(_set_camZoom)
	_global_datas.camera_focus_update.connect(update_focus)

# for book update position for example
func update_focus(focus_data : boardCamState_data):

	_set_zoom_pos(focus_data)	

	
func _set_camZoom(Cam_ref : boardCamState_data):
	
	_set_zoom_pos(Cam_ref)
	
	
func _process(delta):
	
	
	if !_global_datas.camera_current_state == game_state.camera_state.Scanner:
		return	
		

	if Input.is_action_pressed((_global_datas.move_right)):
	
		loader.rotation_degrees.y -=  100 * delta

	if Input.is_action_pressed((_global_datas.move_left)):
	
		loader.rotation_degrees.y +=  100 * delta
			

func _input(event):
	
	if _global_datas.camera_current_state == game_state.camera_state.Main:
		return	
	
	
	if lock_action:
		return
		
	if event.is_action_pressed("Click_on_board"):
		process_zoom_in()
			

		
func process_zoom_in():

	lock_action = true
	
	var t
	t = create_tween()
	t.tween_property(Cam_to_move,"position",zoom_position,0.8).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var s
	s = create_tween()
	s.tween_property(Cam_to_move_scanner,"position",zoom_position,0.8).set_trans(Tween.TRANS_SINE)

	
	_global_datas._add_back_call.emit(process_zoom_out)
	
	
	
func process_zoom_out():
	

	lock_action = true
	
	var t
	t = create_tween()
	t.tween_property(Cam_to_move,"position",no_zoom_pos,0.8).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var s
	s = create_tween()
	s.tween_property(Cam_to_move_scanner,"position",no_zoom_pos,0.8).set_trans(Tween.TRANS_SINE)

	
	
func done():
	lock_action = false	
			
func _set_zoom_pos(Cam_ref):

	if Cam_ref == null:
		return
		
	var dir = Cam_ref.camera_position_node.get_camera_transform().basis.z
	var forward = -dir.normalized()

	no_zoom_pos = Cam_ref.camera_position_node.global_position
	zoom_position = no_zoom_pos + forward * Cam_ref.zoom_value	
	
	
	

	
