extends Node



func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	_global_datas.Player_is_pod_zone = true
	
func _on_area_3d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):

	_global_datas.Player_is_pod_zone = false


func _on_player_oxygene_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	_global_datas._reload_oxygene.emit()


func _on_player_oxygene_area_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	_global_datas._use_oxygene.emit()
