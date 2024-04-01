extends HSlider

@onready var label = $"../Label"

func change_dither(value):
	RenderingServer.global_shader_parameter_set("Dither_size",value)


func _on_value_changed(new_value):

	change_dither(new_value)	
	label.text = str(new_value)
