extends Node


const ZONE_INFO_DIALOGUE = "res://15_GAME_RESSOURCE/00_Zone_data/Zone_info_dialogue.json"

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
		
		var reader = dialogue_info_reader.new()
		var result = reader.node_by_name(ZONE_INFO_DIALOGUE,_global_datas.zoneData.zone_node_dialogue,0)
		_global_datas._show_object_legend.emit(true,result)
		_set_progress_bar()
		
		_global_datas.zoneData.fade_out._show()
	else:
		_global_datas._show_object_legend.emit(false,"_null")
		_global_datas.zoneData.fade_out._stop()

func _set_progress_bar():
	var _target_pos =  _global_datas.zoneData.Boue_node_3D.global_position + Vector3(0.0,2.0,0.0)
	_global_datas.subscene_progress_bar_sprite.global_position = _target_pos 
	
	
	
