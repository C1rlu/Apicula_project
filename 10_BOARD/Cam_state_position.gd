extends Camera3D

@export var position_camera_state : boardCamState_data

func _ready():
	position_camera_state.camera_state = self
