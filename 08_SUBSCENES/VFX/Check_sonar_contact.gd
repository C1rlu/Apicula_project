extends Node


func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var check = area.get_node_or_null("Check_Mirror_element")	
		if check:
			check.check_mirror()

