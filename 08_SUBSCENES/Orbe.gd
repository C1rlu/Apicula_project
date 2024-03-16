extends Node


@export var orbe_list : Array[orbe_data]
	
func _ready():
	_global_datas._orbe_type_list = orbe_list
	_global_datas._backFrom_subscene.connect(reload_teleporter)
	_global_datas._remove_orbe_from_data.connect(remove_orbe)

func reload_teleporter():
	
	for o in _global_datas._orbe_type_list:
		o.Orbe_scene_amount = 0	
	
func remove_orbe(string : String):	
	
	if string == "Teleporter":
		orbe_list[0].Orbe_scene_amount -= 1			
		_global_datas._select_orbe_type.emit(orbe_list[0])
	if string == "Exit mirror":
		orbe_list[1].Orbe_scene_amount -= 1			
		_global_datas._select_orbe_type.emit(orbe_list[1])
