extends Node


@onready var area = $".."


func check_mirror():
	
	var all_areas = area.get_overlapping_areas()
	
	for a in all_areas:
		var mirror_element = a.get_node_or_null("In_Mirror")	
		if mirror_element:
			mirror_element.start_exit()
