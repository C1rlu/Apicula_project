@tool
extends Node3D

@export var position_camera_state : boardCamState_data
@export var _00_camera_taker : Camera3D 

@export var execute_button : bool = false:
	set = node_to_cam_pos

func node_to_cam_pos(new_value : bool):
	execute_button = false 
	global_position = _00_camera_taker.global_position
	rotation_degrees = _00_camera_taker.rotation_degrees	

	
func _ready():
	position_camera_state.camera_position_node = self
