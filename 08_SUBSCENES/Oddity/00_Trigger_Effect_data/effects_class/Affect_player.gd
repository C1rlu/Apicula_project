extends _effect
class_name affect_player

@export var speed_amount : float 

func trigger_effect(element) -> void:
	
	
	var player_rg : RigidBody3D = _global_datas.player_rg
	
	var current_velocity = player_rg.linear_velocity	
	player_rg.apply_central_force(current_velocity * speed_amount)


