extends ColorRect

@onready var element = $"."
@onready var element_mat : Material = element.get_material()

var fade_out

func _fade_out(fade_value : float):
		
	if fade_out:
		fade_out.kill()
	fade_out = create_tween()
	fade_out.tween_method(set_value,1.0,0.0,fade_value)
	
func set_value(value : float):
	element_mat.set_shader_parameter("Opacity",value)	
