extends Node3D

@export var position_camera_state : boardCamState_data

func _ready():
	position_camera_state.camera_position_node = self
