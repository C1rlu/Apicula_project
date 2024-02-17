extends Node

@onready var backdrop_focus = $"../../BACKDROP_FOCUS"
@onready var render_scanner = $"../../RENDER_Scanner"

@onready var render_scanner_material : Material = render_scanner.get_material()
@onready var backdrop_focus_material : Material = backdrop_focus.get_material()


var fade_in


func _ready():
	_global_datas.show_on_scanner.connect(start_fade_in)
	_global_datas.show_board_description.connect(start_fade_out)

func start_fade_in(photodata : PhotoData):

	if fade_in:
		fade_in.kill()
	
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,0.0,1.0,0.5)
	
func start_fade_out(condition : bool, no_need):

	if condition:
		return
		
	if fade_in:
		fade_in.kill()
	
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,1.0,0.0,0.5)
	
	
func set_shader_value(value):
	
	render_scanner_material.set_shader_parameter("Opacity",value)
	var clamp_backdrop = clampf(value,0.0,0.8)
	backdrop_focus_material.set_shader_parameter("Opacity",clamp_backdrop)
