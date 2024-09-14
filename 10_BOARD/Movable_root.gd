extends Node

@export var board_instance_position : MeshInstance3D
@export var movable_root  : Node3D


func _ready():
	_global_datas.movable_root = movable_root
	_global_datas.board_instance_position = board_instance_position
