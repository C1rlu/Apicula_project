extends Node3D


@export var board_intrigue : board_intrigue_data


func _ready():
	board_intrigue.intrigue_node = self	
