extends Node3D



func _ready():
	_global_datas.movable_root = self
	_global_datas.board_instance_position = $"../Static/Board_instanceZone/Board_Instance_Position"
