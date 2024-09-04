extends TextureRect



func _ready():
	
	_fade()
	
	
func _fade():
	
	var fade
	fade = create_tween()
	fade.tween_method(_value,0.0,1.0,0.25)
	

func _value(value : float):
	get_material().set_shader_parameter("Opacity",value)
