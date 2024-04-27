extends Node

@onready var mirror_particule = $"../Mirror_Particule"


	
	
func set_shader_value(value : float):
	
		
	mirror_particule.amount_ratio = value	

func _on_photo_data_scanner_effect_condition(condition):
	mirror_particule.emitting = condition

