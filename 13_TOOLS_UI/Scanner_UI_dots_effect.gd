extends Node


@onready var ui_dots = $"../Dots_scanner"
@onready var material_dots : Material = ui_dots.get_material()

var t

var actual_value : float

func _ready():
	_global_datas.show_ui_scanner_dots.connect(_Ui_dots_effect)
	_global_datas.flash_scanner.connect(flash)
	
	
func flash():
	actual_value = 1	
	_Ui_dots_effect(false)	
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
		t.tween_method(set_shader_value,actual_value,0.0,0.5)
		
		
func set_shader_value(value):
	
	material_dots.set_shader_parameter("Opacity",value)
	actual_value = value
