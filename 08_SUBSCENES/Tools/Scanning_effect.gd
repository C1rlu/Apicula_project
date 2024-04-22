extends Node

@onready var mirror_particule = $"../Mirror_Particule"

@export var render_scanning : MeshInstance3D
var render_scanning_mat : Material 


	
func _ready():
	
	if render_scanning:
		render_scanning_mat = render_scanning.get_surface_override_material(0)	
	
func set_shader_value(value : float):
	
	if render_scanning:
		render_scanning_mat.set_shader_parameter("Opacity",value)
		
	mirror_particule.amount_ratio = value	

func _on_photo_data_scanner_effect_condition(condition):
	mirror_particule.emitting = condition


func _on_photo_data_scanner_effect_value(value):
	set_shader_value(value)	
