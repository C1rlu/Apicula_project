extends Node

@onready var area = $"../Area3D"


func check_push_element():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			var Pusher = areas.get_node_or_null("Push")
			if Pusher:
				Pusher.Push()	




func _on_teleporter_teleport_effect():
	check_push_element()

