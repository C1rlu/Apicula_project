extends Node

@export var all_Cam : Array[Camera3D]

@export var focus_target : Node3D

@onready var board_cam_ref : Camera3D = $"../3D_SCENE/Camera_state/Camera_OnBoard"
@onready var board_cam_zoom : Camera3D = $"../3D_SCENE/Camera_state/Camera_OnBoard_zoom"

var target_position : Vector3

var target_rotation : Vector3
var offset : Vector3
var offset_rotation : Vector3

var board_cam_offset : Vector3
var boardZoom_cam_offset : Vector3

signal set_state_call
signal set_back_call

var cam_state : int = 0


func _ready():
	

	_global_datas.camera_focus_On.connect(_focus)
	offset = all_Cam[0].global_position - focus_target.global_position	
	
	target_position = all_Cam[0].global_position
	target_rotation = all_Cam[0].global_rotation_degrees
	
		
	board_cam_offset = board_cam_ref.global_position - focus_target.global_position 
	boardZoom_cam_offset = board_cam_zoom.global_position - focus_target.global_position	

	
func _focus(focus_data : boardCamState_data):
	
	_global_datas.close_all_over_ui.emit()
	_global_datas.camera_current_state = focus_data.cam_state
	
	target_position = focus_data.camera_position_node.global_position
	target_rotation = focus_data.camera_position_node.rotation_degrees

	# back call will be set here in a back_call class for more flexibility
	if focus_data.back_call:
		focus_data.back_call.back_call()
	
	# could set a emit call class here as well for more flexibility
	set_state_call.emit()
	#set_back_call.emit()

	if _global_datas.camera_current_state == game_state.camera_state.Main:
		cam_state = 0
	if _global_datas.camera_current_state == game_state.camera_state.Board:
		cam_state = 1
	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		cam_state = 2
	if _global_datas.camera_current_state == game_state.camera_state.Disque:
		cam_state = 3
	if _global_datas.camera_current_state == game_state.camera_state.Apicula:
		cam_state = 3
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		cam_state = 3
func _process(delta):

	if cam_state == 0:
		rotation_angle(delta)	
		for c in all_Cam:
			c.global_position  = lerp(c.global_position, target_position, 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation , 3.0 * delta)	
			
	if cam_state == 1:
		rotation_angle(delta)
		for c in all_Cam:
			c.global_position= lerp(c.global_position, focus_target.global_position + board_cam_offset + offset_rotation, 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation + focus_target.rotation_degrees, 3.0 * delta)		
		
				
	if cam_state == 2:
		rotation_angle(delta)
		for c in all_Cam:
			c.global_position = lerp(c.global_position,focus_target.global_position + boardZoom_cam_offset + (offset_rotation/4), 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation + focus_target.rotation_degrees, 3.0 * delta)	
		

	if cam_state == 3:
		
		for c in all_Cam:
			c.global_position = lerp(c.global_position, target_position, 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation, 3.0 * delta)		
			


func rotation_angle(delta):

	var angle_target = focus_target.global_position.x
	
	var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	var target_angle = lerp(-20, 20, t)
	var rotation_target = Vector3(0.0, -target_angle,0.0)
	focus_target.rotation_degrees = rotation_target
	
	var target_offset_x = lerp(-0.125,0.125, t)
	var target_offset_y = lerp(-0.05,0.05, t)
	offset_rotation = Vector3(-target_offset_x, target_offset_y,0.0)
