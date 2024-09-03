extends Node

@export var Rg : RigidBody3D

func _ready():
	_subscene_datas._update_player_weight.connect(_update_amount)

func _update_amount(amount : int):

	if amount > _subscene_datas.player_max_amount:
		Rg.mass = 20	
	else:
		Rg.mass = 5
