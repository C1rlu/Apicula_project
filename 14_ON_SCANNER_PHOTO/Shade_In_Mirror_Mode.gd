extends Node



func _ready():
	pass
	#_global_datas._mirror_switch.connect(_shade_mirror_mode)
	#_global_datas._backFrom_subscene.connect(_shade_mirror_normal)
	
func _shade_mirror_mode(condition : bool):
	RenderingServer.global_shader_parameter_set("Scanner_Mirror_mod", condition)	

func _shade_mirror_normal():
	RenderingServer.global_shader_parameter_set("Scanner_Mirror_mod", false)	
