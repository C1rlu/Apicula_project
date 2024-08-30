extends Node

@export var force : float = 350
@export var rg : RigidBody3D

func Push(origin : Vector3):


	var dir = (_global_datas.subbscene_playerPosition - origin).normalized()
	
	
	#var velocity = rg.linear_velocity
	#var _direction = velocity.normalized()

	rg.apply_central_force(-dir * force)
	
