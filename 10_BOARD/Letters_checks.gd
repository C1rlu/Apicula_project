extends Node3D


@export var test_data : Note_Data


var all_note : Array

func _ready():
	all_note = get_children()

	#_global_datas.note_archives.append(test_data)
	_global_datas.open_inventory.connect(_check_found)

		
func _check_found(condition : bool):
	
	if !condition:
		return
		
	for e in all_note:
		if check_photo_exist(e.Note_data):
			e._active()	
	
func check_photo_exist(note_Data):

	for note in _global_datas.note_archives:
		if note == note_Data:
			return true 	
