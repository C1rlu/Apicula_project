extends Node

const BASE_ORBE_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"

func _ready():
	_global_datas._instance_orbe.connect(_instance_at_pos)
	
	
func _instance_at_pos():
	
	var player_position = _global_datas.subbscene_playerPosition
	
	var orbe = BASE_ORBE_PREFABS.instantiate()
	orbe.position  =  player_position
	load_scene.add_child(orbe)

