extends Node


func _ready():
	
	var Distro = OS.get_distribution_name()
	
	print(Distro)
	if Distro == "SteamOS":
		
		set_resolution(1)
	
	if Distro == "Windows":
		set_resolution(0)
			


	
func set_resolution(index):
	
	var current_selected = index
	
	if current_selected == 0:
		
		get_window().content_scale_size = Vector2(1280,720)
		_global_datas.set_resolution.emit(Vector2(1280,720))
	
		RenderingServer.global_shader_parameter_set("Dither_size",0.4)
		RenderingServer.global_shader_parameter_set("Dither_blue_noise_size",10)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		print("SCREEN SIZE",Vector2(1280,720))

	if current_selected == 1:
		_global_datas.set_resolution.emit(Vector2(1280,800))
		get_window().content_scale_size = Vector2(1280,800)
	
		RenderingServer.global_shader_parameter_set("Dither_size",0.3)
		RenderingServer.global_shader_parameter_set("Dither_blue_noise_size",10)	
		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		print("SCREEN SIZE",Vector2(1280,800))		
		
	if current_selected == 3:
		_global_datas.set_resolution.emit(Vector2(1920,1080))
		get_window().content_scale_size = Vector2(1920,1080)
	
		RenderingServer.global_shader_parameter_set("Dither_size",0.4)
		RenderingServer.global_shader_parameter_set("Dither_blue_noise_size",10)	
		print("SCREEN SIZE",Vector2(1920,1080))		
