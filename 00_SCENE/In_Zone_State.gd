extends Node

signal _show_cost(condition : bool , position, Vector3, cost : int )
@onready var progress_bar = $Cost_viewport/ProgressBar


func _ready():
	_global_datas._active_this_zone.connect(_active)
	_global_datas._show_boue_options.connect(_active_options)
	
func _active(condition : bool, zone : ZoneData):
	
	if zone.Boue_active:

		if condition:
			_global_datas._active_sonar.emit(zone.Boue_node_3D.global_position)
		if zone.epave_if_exist.Fade_out:
			zone.epave_if_exist.Fade_out._active(condition)
	
		_show_cost.emit(false,Vector3.ZERO,3)
		
	else:
		var target_pos =  _global_datas.zoneData.center_zone_node.global_position + + Vector3(0.0,1.0,0.0)
		
		var cost = _global_datas.zoneData.purchass_state[_global_datas.zoneData.purchass_index_state].cost
		_show_cost.emit(condition,target_pos,cost)			
	_global_datas._load_subscene.emit(condition)
	
	
func _active_options(condition : bool):
	
	if !_global_datas.zoneData:
		return
	
	var limit_state = _global_datas.zoneData.purchass_state.size()
	if _global_datas.zoneData.purchass_index_state >= limit_state:
		_global_datas._in_boue_options = false
		return  	
		
	_global_datas._in_boue_options = condition
	if _global_datas.zoneData:
		var target_pos =  _global_datas.zoneData.Boue_node_3D.global_position + Vector3(0.0,2.25,0.0)
		var cost = _global_datas.zoneData.purchass_state[_global_datas.zoneData.purchass_index_state].cost
		_show_cost.emit(condition,target_pos,cost)
		
	_global_datas._active_progress_subscene.emit(false)


