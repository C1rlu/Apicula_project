extends Node

@onready var scanner_zone = $"../Scanner_zone"


func _on_timer_timeout():
	check_area()	
		
func check_area():
	
	var overlap_areas =  scanner_zone.get_overlapping_areas()
	
	if overlap_areas == null:
		return
	
	for area in overlap_areas:
		
		var rapatrier = area.get_node_or_null("Rapatrier")	
		if rapatrier:
			
			var is_rapatried : bool = rapatrier.is_rapatried
			if !is_rapatried:
				rapatrier.active_fusion(true)
				_global_datas.flash_x_ray_oddity.emit()		
			else:
				rapatrier.active_fusion(false)
				
			



