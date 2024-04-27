extends Node

const RAPATRIER_VFX_PREFABS = preload("res://08_SUBSCENES/Orbe/Rapatrier/Rapatrier_VFX_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


func _ready():
	
	_global_datas.rapatrier_vfx.connect(_rapatrier)
	

func _rapatrier(position : Vector3):

	var instance_vfx = RAPATRIER_VFX_PREFABS.instantiate() 
	instance_vfx.global_position = position
	load_scene.add_child(instance_vfx)
