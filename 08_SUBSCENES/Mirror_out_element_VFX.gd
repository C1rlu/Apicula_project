extends Node

const MIRROR_EXIT_VFX = preload("res://08_SUBSCENES/VFX/mirror_exit_vfx.tscn")
@onready var load_scene = $"../LoadScene"
func _ready():
	_global_datas.out_mirror_element.connect(active_fx)

func active_fx(pos : Vector3):
	
	var vfx = MIRROR_EXIT_VFX.instantiate()
	load_scene.add_child(vfx)
	vfx.position = pos
	vfx.scale = Vector3.ONE

