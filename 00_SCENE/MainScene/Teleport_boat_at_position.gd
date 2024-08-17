extends Node


@onready var player_boat = $"../--DECOR--/Player_Boat"



func _ready():
	
	_global_datas._teleport_boat_at_pos.connect(_teleport)
	
	
func _teleport(n_position : Vector3):
	player_boat.global_position = n_position	

