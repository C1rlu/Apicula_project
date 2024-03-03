extends Node



func _ready():
	_global_datas.active_mirror_switch.connect(_shade_mirror_mode)
	
func _shade_mirror_mode(condition : bool):
	RenderingServer.global_shader_parameter_set("Scanner_Mirror_mod", condition)		
