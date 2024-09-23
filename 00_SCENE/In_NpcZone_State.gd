extends Node

@export var bird_data : Npc_datas

func _ready():
	_global_datas._active_this_npc_zone.connect(_active)

func _active(condition : bool):

	
	var Npc_zone = _global_datas.Npc_Dialogue

	if !Npc_zone:
		return
		
	if _global_datas.Npc_Dialogue == bird_data:
		if bird_data.is_active:
			_global_datas._disable_bird_meet_for_today.emit(true)	
			_global_datas._check_dialogue_photo.emit()
		return
					
	if Npc_zone.is_active:
		_global_datas.in_dialogue_zone.emit(condition)
		_global_datas.subscene_progress_bar_sprite.visible = false	
		_global_datas._show_object_legend.emit(_global_datas.Npc_Dialogue.name)


		
