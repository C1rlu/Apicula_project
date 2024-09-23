extends Node

func _ready():
	
	_global_datas._active_this_dive_zone.connect(_active)
	


func _active(condition : bool):
	
	
	if !_global_datas.zoneData:
		return
	
	if _global_datas._time_state == 0:
		_global_datas.subscene_progress_bar_sprite.visible = false	
	else:
		_global_datas.subscene_progress_bar_sprite.visible = condition	

	if _global_datas.zoneData.zone_packed_scene: 				
		_global_datas._load_subscene.emit(condition)
	
	if condition:
		var _target_pos =  _global_datas.zoneData.Boue_node_3D.global_position
		_global_datas._active_sonar.emit(_target_pos)
		_global_datas._show_object_legend.emit(true,_global_datas.zoneData.zone_node_dialogue)
	else:
		_global_datas._show_object_legend.emit(false,"_null")
