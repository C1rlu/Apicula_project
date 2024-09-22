extends Node

@export var bird_data : Npc_datas

func _ready():
	_global_datas._active_this_npc_zone.connect(_active)

	
func _active(condition : bool):

	
	var Npc_zone = _global_datas.Npc_Dialogue
	print(Npc_zone)
	
	if !Npc_zone:
		return
		
	if _global_datas.Npc_Dialogue == bird_data:
		_global_datas._open_dialogue.emit()
		_global_datas._disable_bird_meet_for_today.emit(true)
		return
					
	if Npc_zone.is_active:
		_global_datas.in_dialogue_zone.emit(condition)
		_global_datas._show_cost.emit(false,Vector3.ZERO,3)
		_global_datas.subscene_progress_bar_sprite.visible = false	
	else:

		var target_pos =  Npc_zone.dialogue_ui_center_position.global_position + Vector3(0.0,1.0,0.0)
		var cost = Npc_zone.cost
		_global_datas._show_cost.emit(condition,target_pos,cost)
		
