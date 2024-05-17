extends Node

@onready var mirror_particule = $"../../Mirror_Particule"


func _on_photo_data_scanner_effect_condition(condition):
	mirror_particule.emitting = condition

