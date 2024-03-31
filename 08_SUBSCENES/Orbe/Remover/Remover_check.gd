extends Node

var area 
var root

func _ready():
	
	area = $"../Area3D"
	root = $".."

	
func _check_area_to_remove():
	
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
	
		var mirror_node = areas.get_node_or_null("Line_remover")

		if mirror_node:
			mirror_node.remover()

	root.queue_free()	


func _on_timer_timeout():
	_check_area_to_remove()
