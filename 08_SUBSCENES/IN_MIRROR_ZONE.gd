extends Node

@onready var mirror_view = $"../Viewport/Mirror_view"

func _ready():
	_global_datas.in_mirror_zone.connect(mirror_zone)	
	
	

func mirror_zone():
	
	var player_state = _global_datas.player_state
	 
	if player_state == game_state.visible_state.normal:
		mirror_view.visible = false
		#RenderingServer.global_shader_parameter_set("mirror_wave_speed", 0.0)
		RenderingServer.global_shader_parameter_set("isGray", 0.0)	
	if player_state == game_state.visible_state.mirror:
		mirror_view.visible = true
		#RenderingServer.global_shader_parameter_set("mirror_wave_speed", 0.02)
		RenderingServer.global_shader_parameter_set("isGray", 1.0)	
		
		
	
	
	
	
