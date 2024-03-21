extends Node


@export var orbe_list : Array[orbe_data]


func _ready():
	_global_datas._orbe_type_list = orbe_list
	_global_datas._add_orbe_in_inventory.connect(add_orbe_in_inventory)

func add_orbe_in_inventory(orbe : orbe_data):
	_global_datas._orbe_type_list.append(orbe)	
	
	
