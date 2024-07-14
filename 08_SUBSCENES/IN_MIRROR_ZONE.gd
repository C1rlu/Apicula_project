extends Node

@onready var mirror_view = $"../Viewport/Mirror_view"

func _ready():
	_global_datas.in_mirror_zone.connect(mirror_zone)	
	
	

func mirror_zone(condition : bool):
	#RenderingServer.global_shader_parameter_set("active_Dither", !condition)	
	
	mirror_view.visible = condition	
