extends Node


@onready var render_scanner = $"../../3D_SCENE/RENDER_Scanner"
@onready var render_scanner_material : Material = render_scanner.get_material()


@onready var backdrop_focus = $"../../3D_SCENE/BACKDROP_FOCUS"
@onready var backdrop_focus_material : Material = backdrop_focus.get_material()

var actual_value_b : float
var fade_in

func _ready():
	_global_datas.show_on_scanner.connect(show_scanner)
	_global_datas.show_on_scanner_backdrop.connect(show_backdrop)

func show_scanner(condition : bool):
	

	if condition:
		if fade_in:
			fade_in.kill()
	
		fade_in = create_tween()
		fade_in.tween_method(set_scanner_shader_value,0.0,1.0,1.0).set_trans(Tween.TRANS_SINE)
		
	else:
		
					
		if fade_in:
			fade_in.kill()
	
		fade_in = create_tween()
		fade_in.tween_method(set_scanner_shader_value,1.0,0.0,0.5).set_trans(Tween.TRANS_SINE)	
	
func show_backdrop(condition : bool):

	if condition:
		if fade_in:
			fade_in.kill()
	
		fade_in = create_tween()
		fade_in.tween_method(set_backdrop_shader_value,actual_value_b,1.0,1.0).set_trans(Tween.TRANS_SINE)
		
	else:		
		if fade_in:
			fade_in.kill()
	
		fade_in = create_tween()
		fade_in.tween_method(set_backdrop_shader_value,actual_value_b,0.0,0.5).set_trans(Tween.TRANS_SINE)
	

func set_backdrop_shader_value(value):
	

	backdrop_focus_material.set_shader_parameter("Opacity",value)
	actual_value_b = value
	
func set_scanner_shader_value(value):
	
	render_scanner_material.set_shader_parameter("Opacity",value)

