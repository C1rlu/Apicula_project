extends Node

@onready var mirror_view = $"../Viewport/Mirror_view"

func _ready():
	_global_datas.in_mirror_zone.connect(mirror_zone)	
	
	

func mirror_zone(condition : bool):

	if condition:	
		RenderingServer.global_shader_parameter_set("mirror_wave_speed", 0.02)
	else:
		RenderingServer.global_shader_parameter_set("mirror_wave_speed", 0.0)
	mirror_view.visible = condition	
