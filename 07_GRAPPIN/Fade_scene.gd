extends Node


@export var Render : TextureRect
@onready var material_mat : Material = Render.get_material()

var fade_in
var fade_value: float
func _ready():
	_subscene_datas.go_subscene.connect(fade)
	#material_mat.set_shader_parameter("Opacity",0.0)
	
func fade(condition : bool):
		
	if condition:
		
		if fade_in:
			fade_in.kill()
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,0.0,1.0,0.5)
	
	else:
	
		if fade_in:
			fade_in.kill()
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,fade_value,0.0,0.5)
	
		

func set_shader_value(value):
	material_mat.set_shader_parameter("Opacity",value)
	fade_value = value
