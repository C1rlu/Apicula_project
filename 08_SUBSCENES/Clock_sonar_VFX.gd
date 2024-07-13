extends Node

const SUBSCENE_SONAR_VFX = preload("res://08_SUBSCENES/VFX/subscene_sonar_VFX.tscn")
@onready var load_scene = $"../LoadScene"
@onready var sonar_pos = $"../Sonar_pos"


func _ready():
	_global_datas.subscene_sonar_effect.connect(active_fx)

func active_fx():
	
	var vfx = SUBSCENE_SONAR_VFX.instantiate()
	load_scene.add_child(vfx)
	vfx.position = sonar_pos.global_position
	vfx.scale = Vector3.ONE

