extends Node

@onready var backdrop_focus = $"../BACKDROP_FOCUS"
@onready var backdrop_focus_material : Material = backdrop_focus.get_material()

var fade_in
var current_value : float 
func _ready():
	_global_datas.open_tool_selector.connect(fade)
	
func fade(condition : bool):
	

	if fade_in:
		fade_in.kill()
	
	if condition:

		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,current_value,0.7,0.25)#.set_trans(Tween.TRANS_SINE)
		
	else:
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,current_value,0.0,0.25)#.set_trans(Tween.TRANS_SINE)
	

func set_shader_value(value):
	backdrop_focus_material.set_shader_parameter("Opacity",value)
	current_value = value
