extends Node


@export var orbe_list : Array[orbe_data]


func _ready():
	_global_datas._orbe_type_list = orbe_list
	_global_datas._add_orbe_in_inventory.connect(add_orbe_in_inventory)
	_global_datas._backFrom_subscene.connect(reset_subcenes_photoData)
	
func add_orbe_in_inventory(orbe : orbe_data):
	_global_datas._orbe_type_list.append(orbe)	
	
	
func reset_subcenes_photoData():
	#clear photo dates list when leave subscene
	_global_datas._photo_data_scene_list.clear()
	
	
