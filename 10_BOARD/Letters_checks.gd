extends Node3D

@export var all_question_note : Array[Note_Data]

var all_note : Array

func _ready():
	all_note = get_children()

	for n in all_question_note:
		_global_datas.note_archives.append(n)	
		
	_global_datas.open_inventory.connect(_check_found)

	disable()	
	
func disable():
	
	for n in all_note :
		n._disable_object()		
		
			
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
