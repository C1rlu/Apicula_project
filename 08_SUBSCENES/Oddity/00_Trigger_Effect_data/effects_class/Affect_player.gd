extends Fusion_effect
class_name affect_player

@export var speed_amount : float 

func trigger_fusion() -> void:
	
	
	var player_rg : RigidBody3D = _global_datas.player_rg
	
	var current_velocity = player_rg.linear_velocity	
	var current_speed = current_velocity.length()

	if current_speed > 1.3:
		return
	player_rg.apply_central_force(current_velocity * speed_amount)


