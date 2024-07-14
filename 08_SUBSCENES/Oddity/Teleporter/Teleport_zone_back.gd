extends Node




func _teleport():
	
	if _global_datas.active_subscene_zone:
		_global_datas.selected_subscene = _global_datas.active_subscene_zone
		_global_datas.teleportation_active = true
		_global_datas.in_mirror_zone.emit(false)
		
		_global_datas._load_subscene.emit(true)
		
	
