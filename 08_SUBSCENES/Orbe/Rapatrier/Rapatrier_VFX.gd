extends Node

const RAPATRIER_VFX_PREFABS = preload("res://08_SUBSCENES/Orbe/Rapatrier/Rapatrier_VFX_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


func _ready():
	
	_global_datas.rapatrier_vfx.connect(_rapatrier)
	

func _rapatrier(position : Vector3):
	
	var instance_vfx = RAPATRIER_VFX_PREFABS.instantiate() 
	instance_vfx.position = position
	load_scene.add_child(instance_vfx)
	_kill_one_scanner()

func _kill_one_scanner():
	#if _global_datas.scanner_element_list.size() > 0:	
	var random_index = randi_range(0,_global_datas.scanner_element_list.size())
	var selected_scanner = _global_datas.scanner_element_list[random_index-1]  
	selected_scanner.kill()

			

