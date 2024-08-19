extends Node


var movable_object 

func _ready():
	_global_datas.select_movable_object.connect(_update_movable_object)

func _update_movable_object(object):
	movable_object = object
	
	
func _input(event):
	
	if !movable_object:
		return
	
	if event.is_action_pressed("next_right"):
		movable_object._rotate.emit(1)
		
	if event.is_action_pressed("next_left"):
		movable_object._rotate.emit(-1)



