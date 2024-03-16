extends Node

@onready var load_scene = $"../LoadScene"

@export var orbe_data_type : orbe_data


func _ready():
	_global_datas._instance_teleporter.connect(_instance_teleporter)

	_global_datas._select_orbe_type.connect(select_this_orbe)
	
func select_this_orbe(orbe_type : orbe_data):
	
	orbe_data_type = orbe_type
	
	
func _instance_teleporter():
	
	if orbe_data_type.Orbe_scene_amount == orbe_data_type.Orbe_max_amount:
		return 
		
	orbe_data_type.Orbe_scene_amount += 1	
	
	
	var player = _global_datas.subbscene_playerPosition
	var offset = Vector3(0.0,0.15,0.0)
	var orbe_prefab : PackedScene = orbe_data_type.Orbe_prefab
	var instance_teleporter = orbe_prefab.instantiate()			
	instance_teleporter .position = player + offset
	load_scene.add_child(instance_teleporter)
	
	_global_datas._select_orbe_type.emit(orbe_data_type)
	


