extends Node


@export var orbe_list : Array[orbe_data]
	
func _ready():
	_global_datas._orbe_type_list = orbe_list
	_global_datas._backFrom_subscene.connect(reload_teleporter)


func reload_teleporter():
	
	for o in _global_datas._orbe_type_list:
		o.Orbe_scene_amount = 0	
	
