extends Node

func _teleport():
	
	if _global_datas.active_subscene_zone:
		_global_datas.selected_subscene = _global_datas.active_subscene_zone
		_global_datas._load_subscene.emit(true)
		_global_datas.vortex_teleport.
	
