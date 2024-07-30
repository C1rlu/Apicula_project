extends Camera3D

@export var focus_data : boardCamState_data


func _ready():
	focus_data.camera_position_node = self

