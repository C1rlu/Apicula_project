extends Node


func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var player_is_here = area.get_node_or_null("Player")
		if player_is_here:
			_global_datas._mirror_switch.emit(false)	
