extends Node

@onready var root = $"../.."
@onready var area = $".."

var connector 
func check_if_connector():
	
	
	var overlap_areas_ = area.get_overlapping_areas()
	
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		
		if connector:
			return
			
		connector = areas.get_node_or_null("Connector")
		print(connector)	

						
	if !connector:
			root.queue_free()				


func _on_timer_timeout():
	check_if_connector()
