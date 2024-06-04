extends Node

@onready var map_texture = $".."
@onready var material : Material = map_texture.get_surface_override_material(0)

var f
var fade_value : float = 1.2

func _ready():
	pass
	#_global_datas.map_fade.connect(map_fade)
	
func map_fade(condition : bool):
	
	if f:
		f.kill()
	
	if condition:
		f = create_tween()
		f.tween_method(set_shader_value,fade_value,1.2,0.5)	
	else:
		f = create_tween()
		f.tween_method(set_shader_value,fade_value,1.1,0.5)			

func set_shader_value(value):
	material.set_shader_parameter("Opacity",value)
	fade_value = value	
