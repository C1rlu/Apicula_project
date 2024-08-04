extends Node

@onready var h_box_container = $"../Center/HBoxContainer"

var fade_in
var current_value : float 


func _ready():
	h_box_container.modulate.a = 0.0

func fade(condition : bool):
	
	if fade_in:
		fade_in.kill()
	
	if condition:
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,0.0,1,0.3)#.set_trans(Tween.TRANS_SINE)
	else:
		fade_in = create_tween()
		fade_in.tween_method(set_shader_value,1.0,0.0,0.3)#.set_trans(Tween.TRANS_SINE)
		fade_in.connect("finished",done)

func done():
	pass
	
func set_shader_value(value):
	h_box_container.modulate.a = value

func _fade(condition):
	fade(condition)	
