extends Node


@export var already_in_inventory : Array[PhotoData]

func _ready():
	
	for e in already_in_inventory:
		_global_datas.photo_archives.append(e)	
		
