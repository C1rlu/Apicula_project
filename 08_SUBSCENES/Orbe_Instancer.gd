extends Node

const BASE_ORBE_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"

const MIRROR_PREFABS = preload("res://08_SUBSCENES/Elements/Mirror_zone/mirror_prefabs.tscn")



func _ready():
	_global_datas._instance_orbe.connect(_instance_at_pos)
	_global_datas.instance_mirror_at_pos.connect(_instance_mirror_at_pos)
	
func _instance_at_pos():
	
	var player_position = _global_datas.subbscene_playerPosition
	
	var orbe = BASE_ORBE_PREFABS.instantiate()
	orbe.position  =  player_position
	load_scene.add_child(orbe)
	_global_datas._orbe_list.append(orbe)

func _instance_mirror_at_pos():
	
	var player_position = _global_datas.subbscene_playerPosition
	
	var mirror = MIRROR_PREFABS.instantiate()
	mirror.position  =  player_position
	load_scene.add_child(mirror)
	_global_datas._orbe_list.append(mirror)

