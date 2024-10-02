extends Node



@export var Player_Rg : RigidBody3D
var base_position : Vector3

func _ready():
	base_position = Player_Rg.position

	_subscene_datas.go_subscene.connect(reset_player)



func reset_player(condition):
	Player_Rg.linear_velocity = Vector3.ZERO

	Player_Rg.position = base_position
