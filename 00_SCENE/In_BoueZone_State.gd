extends Node



func _ready():
	_global_datas._show_boue_options.connect(_active_options)
	
	
func _active_options(condition : bool):
	
	if !_global_datas.zoneData:
		return
	
	if condition:
		#var _target_pos =  _global_datas.zoneData.Boue_node_3D.global_position
		#_global_datas._active_sonar.emit(_target_pos)
		_global_datas.subscene_progress_bar_sprite.visible = false	
		
		
	var limit_state = _global_datas.zoneData.purchass_state.size()
	if _global_datas.zoneData.purchass_index_state >= limit_state:
		_global_datas._show_cost.emit(false,Vector3.ZERO,0)
		return  	
	
	# to show cost of the current purchass state	
	var target_pos =  _global_datas.zoneData.Boue_node_3D.global_position + Vector3(0.0,2.25,0.0)
	var cost = _global_datas.zoneData.purchass_state[_global_datas.zoneData.purchass_index_state].cost
	_global_datas._show_cost.emit(condition,target_pos,cost)
	
	# disable dive zone progress bar 
	_global_datas._active_progress_subscene.emit(false)

	
