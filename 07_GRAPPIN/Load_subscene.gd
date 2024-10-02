extends Node


@export var loader : Node3D

func _ready():
	_subscene_datas.go_subscene.connect(_player_in_subscene)
	
	
func _player_in_subscene(condition : bool):
	
	_subscene_datas.player_in_subscene = condition	

	if condition:
		instance_loaded_scene()	
	else:
		reset_scene()
		
func instance_loaded_scene():
	
	reset_scene()
	
	if _global_datas.zoneData.zone_packed_scene:
		var instance_scene = _global_datas.zoneData.zone_packed_scene.instantiate()
		loader.add_child(instance_scene)	

func reset_scene():
	
	for child in loader.get_children():
			child.queue_free()
