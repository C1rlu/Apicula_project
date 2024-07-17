extends Node

@export var force : float = 350
@export var rg : RigidBody3D

func Push(target : Vector3):

	var direction = (target  - rg.global_position).normalized()	
	rg.apply_central_force(direction * force)
	
