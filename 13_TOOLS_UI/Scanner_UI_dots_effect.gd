extends Node


@onready var ui_dots = $"../Dots_scanner"
@onready var material_dots : Material = ui_dots.get_material()

var t


func _ready():
	_global_datas.show_ui_scanner_dots.connect(_Ui_dots_effect)


func _Ui_dots_effect(condition : bool):
	
	
	if t:
		t.kill()

	if condition:
		
		var random_translation = randf_range(0,10)
		material_dots.set_shader_parameter("Translation",random_translation)
	
		t = create_tween()	
		t.tween_method(set_shader_value,0.0,1.0,0.5)
	else:
		t = create_tween()	
		t.tween_method(set_shader_value,1.0,0.0,0.5)
		
		
func set_shader_value(value):
	
	material_dots.set_shader_parameter("Opacity",value)
	
