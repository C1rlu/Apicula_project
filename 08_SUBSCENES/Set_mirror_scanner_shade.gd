extends Node


func _ready():
	pass
	#_global_datas.active_mirror_switch.connect(set_mirror_scene_active)
	
	
func set_mirror_scene_active(condition : bool):
	RenderingServer.global_shader_parameter_set("mirror_scene_active", condition)	
