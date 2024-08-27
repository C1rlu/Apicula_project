extends Node

@onready var timer_delay = $Timer_delay
const PUSH_GRAV_PREFAB = preload("res://08_SUBSCENES/VFX/pushGrav_prefab.tscn")

func _ready():
	_global_datas.GravTool_effect.connect(add_pushGrav)
	
	
	
func add_pushGrav(position : Vector3):
	
	
	if !timer_delay.is_stopped():
		return
	
	timer_delay.start()
	var vfx = PUSH_GRAV_PREFAB.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.position = position
	vfx.scale = Vector3.ONE

	
