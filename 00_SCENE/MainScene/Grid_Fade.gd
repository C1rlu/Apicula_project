extends Node

@export var Main_render : TextureRect
var main_mat : Material

func _ready():
	main_mat = Main_render.get_material()	

	_global_datas._active_sonar.connect(fade_grid)


func fade_grid(nulll):
	
	var fade
	fade = create_tween()
	fade.tween_method(_value,0.25,0.0,4.0)


func _value(value : float):
	
	main_mat.set_shader_parameter("Grid_opacity", value)	
