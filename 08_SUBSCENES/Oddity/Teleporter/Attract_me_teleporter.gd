extends Node


@export var rg : Node3D
@export var strenght : float = 200

func attract_me(delta,position):
	
	rg.global_position = lerp(rg.global_position,position,strenght * delta)
