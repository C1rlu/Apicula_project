extends Node

@onready var photo_effect_dots = $"../Photo_effect_dots"
@onready var material_dots : Material = photo_effect_dots.get_material()


var t

func _ready():
	_global_datas.show_subscene_scanner.connect(_Ui_dots_effect)
	
	
func _Ui_dots_effect():
	photo_effect_dots.visible = true
	if t:
		t.kill()

	var random_translation = randf_range(0,10)
	material_dots.set_shader_parameter("Translation",random_translation)
	
	t = create_tween()	
	t.tween_method(set_shader_value,0.07,0.0,3.0)
	t.connect("finished",done)
		
func done():
	photo_effect_dots.visible = false	
	
func set_shader_value(value):
	material_dots.set_shader_parameter("Opacity",value)

