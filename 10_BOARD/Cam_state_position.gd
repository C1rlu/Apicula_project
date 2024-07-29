@tool
extends Node3D

@export var position_camera_state : boardCamState_data
@export var _00_camera_taker : Camera3D 

@export var node_to_cam : bool = false:
	set = node_to_cam_pos
	
	
@export var cam_to_node : bool = false:
	set = cam_to_node_pos
	
	
func node_to_cam_pos(new_value : bool):
	node_to_cam  = false 
	global_position = _00_camera_taker.global_position
	rotation_degrees = _00_camera_taker.rotation_degrees	

func cam_to_node_pos(new_value : bool):
	cam_to_node= false 
	_00_camera_taker.global_position = global_position 
	_00_camera_taker.rotation_degrees = rotation_degrees 
	
func _ready():
	#position_camera_state.camera_position_node = self
	position_camera_state.p_position = global_position
	position_camera_state.r_position = rotation_degrees
	
	_global_datas.show_page.connect(update_pos)
	
func update_pos(value):
	position_camera_state.p_position = global_position
	position_camera_state.r_position = rotation_degrees	
