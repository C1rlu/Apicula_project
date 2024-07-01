extends Node



func _ready():
	pass
	#_global_datas._go_Subscene.connect(change_color)
	#_global_datas._backFrom_subscene.connect(back_to_normal)
	
func change_color():
	RenderingServer.global_shader_parameter_set("link_opacity", 1.0)	

func back_to_normal():
	RenderingServer.global_shader_parameter_set("link_opacity", 0.0)		
