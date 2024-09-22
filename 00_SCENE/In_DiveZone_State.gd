extends Node

func _ready():
	_global_datas.open_inventory.connect(func(): _active(false))
	_global_datas._active_this_dive_zone.connect(_active)
	

	
func _active(condition : bool):
	
	var zone = _global_datas.zoneData
	if !zone:
		return
		
	if _global_datas._time_state == 0:
		_global_datas.subscene_progress_bar_sprite.visible = false	
	else:
		_global_datas.subscene_progress_bar_sprite.visible = condition	

	if _global_datas.zoneData.zone_packed_scene: 				
		_global_datas._load_subscene.emit(condition)
	
	
	if condition:
		_global_datas._show_cost.emit(false,Vector3.ZERO,0)

