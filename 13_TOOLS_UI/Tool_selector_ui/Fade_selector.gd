extends Node

@onready var h_box_container = $"../Center"
@onready var backdrop_focus = $"../BACKDROP_FOCUS"
@onready var backdrop_focus_mat : Material = backdrop_focus.get_material()

@export var to_show : Array[Control]

var current_value : float 
var is_fade_in : bool = false
var is_fade_out : bool = false

func _ready():
	h_box_container.modulate.a = 0.0

	for e in to_show:
		e.visible = false
		
func fade(condition : bool):
	
	for e in to_show:
		e.visible = condition
		
	if condition:
		is_fade_in = true
		is_fade_out = false
	else:
		is_fade_in = false
		is_fade_out = true


func done():
	h_box_container.visible = false
	
	
func _process(delta):
	
	#print(delta)
	if is_fade_in:
		current_value += 25 * delta 
		#print(current_value)
		set_shader_value(current_value)	
		if current_value > 1:
			is_fade_in = false		
		
	if is_fade_out:
		current_value -= 25 * delta	
		set_shader_value(current_value)
		if current_value < 0:
			is_fade_out = false	
			

func set_shader_value(value):
	h_box_container.modulate.a = value
	var clamp_value = clamp(value,0.0,0.5)
	backdrop_focus_mat.set_shader_parameter("Opacity",clamp_value)

func _fade(condition):
	fade(condition)	
