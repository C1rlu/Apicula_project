extends Node3D

var all_photos
func _ready():
	all_photos = get_children()
	_global_datas.open_inventory.connect(_check_found)

func _check_found(condition : bool):
	
	if !condition:
		return
		
	for e in all_photos:
			e.check_state()
		
