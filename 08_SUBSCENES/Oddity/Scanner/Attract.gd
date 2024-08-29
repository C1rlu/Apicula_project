extends Node


@export var rg : RigidBody3D
@export var strenght : float = 200
var target_dir : Vector3





func attract_me(delta,position):

		
	target_dir = position
	
	var direction = (target_dir  - rg.global_position).normalized()	
	rg.apply_central_force(direction * strenght * delta)
	

func Push(strengh):
		
	var target = (rg.global_position - _global_datas.subbscene_playerPosition).normalized()
	rg.apply_impulse(target  * strengh)
