extends Node3D

@export var active_quest : Note_Data

var all_note : Array

func _ready():
	all_note = get_children()

	_global_datas.open_inventory.connect(_check_found)
	_global_datas.active_queste = active_quest
	disable()	
	
func disable():
	
	for n in all_note :
		n._disable_object()		
		
			
func _check_found(condition : bool):
	
	if !condition:
		return
		
	#disable()
	if _global_datas.active_queste:
		_global_datas.active_queste.scene_node_3d._active()
	
func check_photo_exist(note_Data):

	for note in _global_datas.note_archives:
		if note == note_Data:
			return true 	
