extends Node

@export var rg : RigidBody3D
@export var strenght : float = 200
var target_dir : Vector3


func attract_me(delta,position):
	
	target_dir = position
	
	var direction = (target_dir  - rg.global_position).normalized()	
	rg.apply_central_force(direction * strenght * delta)
	

