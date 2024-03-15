extends Node


@export var orbe_list : Array[orbe_data]
	
func _ready():
	_global_datas._orbe_type_list = orbe_list
