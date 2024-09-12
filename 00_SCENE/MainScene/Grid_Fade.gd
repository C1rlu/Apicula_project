extends Node

@export var Main_render : TextureRect
var main_mat : Material
var fade
func _ready():
	main_mat = Main_render.get_material()	

	_global_datas._active_sonar.connect(fade_grid)


func fade_grid(_null):
	#_global_datas._show_object_legend.emit(true,_global_datas.subscene_zone_index)
	
	if fade:
		fade.kill()
		
	fade = create_tween()
	fade.tween_method(_value,0.25,0.0,4.0)
	fade.connect("finished",done)

func _value(value : float):
	
	main_mat.set_shader_parameter("Grid_opacity", value)	

func done():
	_global_datas._show_object_legend.emit(false,"null")
