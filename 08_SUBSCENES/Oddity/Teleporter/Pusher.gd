extends Node

@onready var area = $"../Area3D"


func check_push_element():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			var Pusher = areas.get_node_or_null("Push")
			if Pusher:
				var random_target = area.global_position + Vector3(randf_range(0,1),randf_range(0,1),randf_range(0,1))
				Pusher.Push(random_target,1.0)	


func _on_vortex_effect_check_teleporter():
	check_push_element()
