extends Node

@export var oxygene_circle : ColorRect
@onready var oxygene_circle_mat : Material = oxygene_circle.get_material()
@onready var oxy_cicle_update = $"../Oxy_cicle_update"

#func _ready():
	#_global_datas._go_Subscene.connect(show)
	#_global_datas._backFrom_subscene.connect(hide)


func show():
	#oxygene_circle.visible = true
	oxy_cicle_update.visible = true
func hide():
	#oxygene_circle.visible = false	
	oxy_cicle_update.visible = false	
	
	
#func _process(delta):
	#
	#if !_global_datas.Player_InSubScene:
		#return
		#
	#var angle = _global_datas.clock_timer
#
	##var value = lerp(0.0, 2.0, (angle / 360))	
	##oxygene_circle_mat.set_shader_parameter("Opacity",value )
	#var value = lerp(600.0,0.0,(angle / 360))
#
	#oxy_cicle_update.inner_radius = value
