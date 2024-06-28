extends Node3D
var all_responce
func _ready():
	
	all_responce = get_children()
	
	_check_active(false,"null")
	_global_datas.responce_link_mode.connect(_check_active)
	
	
func _check_active(condition,text):
	
	for e in all_responce:
		e.active.emit(condition)		
		
