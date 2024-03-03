extends Node


const TELEPORTER_PREFABS = preload("res://08_SUBSCENES/Teleporter/Teleporter_prefabs.tscn")
@onready var load_scene = $"../LoadScene"

func _ready():
	_global_datas._instance_teleporter.connect(_instance_teleporter)
	
func _instance_teleporter():

	_global_datas.teleporter_amount += 1
	var player = _global_datas.subbscene_playerPosition
	var offset = Vector3(0.0,0.15,0.0)
	
	var instance_teleporter = TELEPORTER_PREFABS.instantiate()			
	instance_teleporter .position = player + offset
	load_scene.add_child(instance_teleporter)


	
	

