extends Node

@onready var main_oddity = $".."


func _check_mirror_element():
	
	var overlap_areas =  main_oddity.get_overlapping_areas()
	
	if overlap_areas == null:
		return
	
	for area in overlap_areas:
		
		var rapatrier = area.get_node_or_null("Rapatrier")	
		if rapatrier:
			
			var is_rapatried : bool = rapatrier.is_rapatried
			if !is_rapatried:
				rapatrier.active_fusion(true)
			else:
				rapatrier.active_fusion(false)	


func _on_bounce_engine_active_flash_mirror():
	_check_mirror_element()
