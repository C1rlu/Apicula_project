extends Node

const SUBSCENE_SONAR_VFX = preload("res://08_SUBSCENES/VFX/subscene_sonar_VFX.tscn")
@onready var load_scene = $"../LoadScene"

@onready var timer_delay = $Timer_delay


func _ready():
	_global_datas.subscene_sonar_effect.connect(active_fx)

func active_fx(position, color : Color):
	
	
	if !timer_delay.is_stopped():
		return
	
	timer_delay.start()
	var vfx = SUBSCENE_SONAR_VFX.instantiate()
	load_scene.add_child(vfx)
	vfx.position = position
	vfx.scale = Vector3.ONE
	vfx._set_color(color)
	
