extends Node

@export var rg : RigidBody3D

var _attract_me : bool = false
var target_dir : Vector3

func attract_me(condition, position):
	
	_attract_me = condition
	target_dir = position	
		

func _process(delta):
	
	if _attract_me:
		var direction = (target_dir  - rg.global_position).normalized()	
		rg.apply_central_force(direction * 250 * delta)
	
