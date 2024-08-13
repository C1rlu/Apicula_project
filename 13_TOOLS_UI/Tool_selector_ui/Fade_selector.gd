extends Node

@onready var h_box_container = $"../Center"
@onready var backdrop_focus = $"../BACKDROP_FOCUS"
@onready var backdrop_focus_mat : Material = backdrop_focus.get_material()

@export var to_show : Array[Control]


var fade_in
var current_value : float 


func _ready():
	h_box_container.modulate.a = 0.0

	for e in to_show:
		e.visible = false
		
func fade(condition : bool):
	
	for e in to_show:
		e.visible = condition
	
	if fade_in:
		fade_in.kill()
	
	if condition:
		
		h_box_container.visible = true
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,0.0,1,0.3)#.set_trans(Tween.TRANS_SINE)
	else:
		h_box_container.visible = false
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,1.0,0.0,0.3)#.set_trans(Tween.TRANS_SINE)
		fade_in.connect("finished",done)

func done():
	h_box_container.visible = false
	
func set_shader_value(value):
	h_box_container.modulate.a = value
	var clamp_value = clamp(value,0.0,0.8)
	backdrop_focus_mat.set_shader_parameter("Opacity",clamp_value)
	
func _fade(condition):
	fade(condition)	
