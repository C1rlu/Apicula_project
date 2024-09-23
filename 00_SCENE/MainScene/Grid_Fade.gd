extends Node

@export var Main_render : TextureRect
var main_mat : Material
var fade
func _ready():
	main_mat = Main_render.get_material()	

func fade_grid(_null):
	
	
	if fade:
		fade.kill()
		
	fade = create_tween()
	fade.tween_method(_value,0.3,0.0,4.0)


func _value(value : float):
	
	main_mat.set_shader_parameter("Grid_opacity", value)	

