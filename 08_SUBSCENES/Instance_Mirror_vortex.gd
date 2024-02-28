extends Node

const mirror_prefab = preload("res://08_SUBSCENES/Elements/Mirror_zone/mirror_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"

func _on_mirror_switch_instance_vortex():
	
	var player = _global_datas.subbscene_playerPosition
	var offset = Vector3(0.0,0.15,0.0)
	
	var instance_mirror = mirror_prefab.instantiate()			
	instance_mirror.position = player + offset
	load_scene.add_child(instance_mirror)
