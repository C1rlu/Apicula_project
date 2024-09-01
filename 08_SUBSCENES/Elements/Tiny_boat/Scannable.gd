extends Node


@export var Photo_data : Node

var hit_index : int 
signal fade
func _hit():

	hit_index += 1
	fade.emit()
	if hit_index >= 3:
		Photo_data.scanning_done()
		hit_index = 0
		
