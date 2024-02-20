extends Node3D

@export var already_in_inventory : Array[PhotoData]

var all_photos
func _ready():
	all_photos = get_children()
	_global_datas.open_inventory.connect(_check_found)

func _check_found(condition : bool):
	
	if !condition:
		return
		
	for e in all_photos:
		if check_photo_exist(e.photo_data):
	
			e._active()	
	
func check_photo_exist(photo_Data):	

	for photo in _global_datas.photo_archives:
		if photo.name == photo_Data.name:
			return true 	
