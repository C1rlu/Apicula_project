extends Node


@export var rg : RigidBody3D

func Push(target : Vector3, force : float):

	var direction = (target  - rg.global_position).normalized()	
	rg.apply_central_force(direction * 350)
