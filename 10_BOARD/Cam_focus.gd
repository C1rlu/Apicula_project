extends Node

@export var _focus_board : boardCamState_data
@export var all_Cam : Array[Camera3D]

@export var focus_target : Node3D

@onready var board_cam_ref : Camera3D = $"../3D_SCENE/Camera_state/Camera_OnBoard"
@onready var board_cam_zoom : Camera3D = $"../3D_SCENE/Camera_state/Camera_OnBoard_zoom"
@onready var board_cam_focus : Camera3D = $"../3D_SCENE/Camera_state/Camera_OnElement_focus"

var target_position : Vector3

var target_rotation : Vector3
var offset : Vector3
var offset_rotation : Vector3


var main_cam_offset : Vector3
var board_cam_offset : Vector3
var boardZoom_cam_offset : Vector3
var boardFocus_cam_offset : Vector3

var cam_state : int = 0


func _ready():
	

	_global_datas.camera_focus_On.connect(_focus)
	offset = all_Cam[0].global_position - focus_target.global_position	
	
	target_position = all_Cam[0].global_position
	target_rotation = all_Cam[0].global_rotation_degrees
	
	main_cam_offset = all_Cam[0].global_position - focus_target.global_position 
	board_cam_offset = board_cam_ref.global_position - focus_target.global_position 
	boardZoom_cam_offset = board_cam_zoom.global_position - focus_target.global_position	
	boardFocus_cam_offset = board_cam_focus.global_position -  focus_target.global_position	
	
	_global_datas.back_to_element_state.connect(back_to_element_state)
	_global_datas.previous_cam_state = _focus_board
		
func back_to_element_state():
	
	_global_datas.camera_focus_On.emit(_focus_board)	
	
func _focus(focus_data : boardCamState_data):

	_global_datas.camera_current_state = focus_data.cam_state
	
	
	
	target_position = focus_data.camera_position_node.global_position
	target_rotation = focus_data.camera_position_node.rotation_degrees



	if _global_datas.camera_current_state == game_state.camera_state.Main:
		cam_state = 0
		_global_datas.previous_cam_state = focus_data
	if _global_datas.camera_current_state == game_state.camera_state.Board:
		cam_state = 1
		_global_datas.previous_cam_state = focus_data
		
		
		
	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		cam_state = 2
	if _global_datas.camera_current_state == game_state.camera_state.Board_Focus_element:
		cam_state = 3
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		cam_state = 4	
		
	_global_datas.close_all_over_ui.emit()	
	
	#print(cam_state)	
func _process(delta):



	if cam_state == 0:
		rotation_angle(delta)	
		for c in all_Cam:
			c.global_position  = lerp(c.global_position, focus_target.global_position + main_cam_offset + (offset_rotation*2), 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation + focus_target.rotation_degrees, 3.0 * delta)	
			
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
			c.global_position = lerp(c.global_position, focus_target.global_position + boardFocus_cam_offset , 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation , 3.0 * delta)		
	

	if cam_state == 4:
		
		for c in all_Cam:
			c.global_position = lerp(c.global_position, target_position, 3.0 * delta)	
			c.rotation_degrees = lerp(c.rotation_degrees, target_rotation , 3.0 * delta)		
			

func rotation_angle(delta):

	#x
	var angle_target = focus_target.global_position.x
	var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	var target_angle = lerp(-20, 20, t)
	#y
	#var angle_target_y = focus_target.global_position.z
	#var angle_target_clamp_y = clampf(angle_target_y,-0.2,1.0)
	#var t_y = (angle_target_clamp_y - -0.5) / ( 0.5 -- 1.0)
	#var target_angle_y = lerp(-20, 10, t_y)

	var rotation_target = Vector3(0.0, -target_angle,0.0)
	
	focus_target.rotation_degrees = rotation_target
	
	#for offset correction here
	var target_offset_x = lerp(-0.125,0.125, t)
	var target_offset_y = lerp(-0.05,0.05, t)
	offset_rotation = Vector3(-target_offset_x, target_offset_y,0.0)


	
