extends OptionButton



func _ready():
	add_item("1280x720")	
	add_item("1920*1080")



func _on_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		DisplayServer.window_set_size(Vector2(1280,720))
		_global_datas.set_resolution.emit(Vector2(1280,720))
		RenderingServer.global_shader_parameter_set("Dither_size",0.6)
	if current_selected == 1:
		DisplayServer.window_set_size(Vector2(1920,1080))
		_global_datas.set_resolution.emit(Vector2(1920,1080))
		RenderingServer.global_shader_parameter_set("Dither_size",0.4)
