extends Node


func _on_zone_collide_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	var mirror_node = area.get_node_or_null("Mirror")
	if mirror_node:
			if !_global_datas.Player_InMirrorScene:
				_global_datas._click_mirror_switch.emit(true)
				_global_datas.Player_InMirrorScene = true
