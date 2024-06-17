extends HSlider

@onready var label = $".."

func change_dither(c_value):
	RenderingServer.global_shader_parameter_set("Dither_size",c_value)


func _on_value_changed(new_value):

	change_dither(new_value)	
	label.text = str(new_value)
