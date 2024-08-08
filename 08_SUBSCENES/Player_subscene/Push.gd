extends Node

@export var force : float = 350
@export var rg : RigidBody3D

func Push():

	var velocity = rg.linear_velocity
	var _direction = velocity.normalized()

	rg.apply_central_force(_direction * force)
	
