extends Node

@export var Viewport_ui : SubViewport 
@export var Sprite_render : Node3D
@export var progress_bar : ProgressBar
@export var visual_coins : Array[Control]


func _ready():
	_global_datas._show_cost.connect(_show_cost)
	_show_cost_amount(0)
	
	progress_bar.value_changed.connect(update_coins_in)
	
func _show_cost(condition : bool,position : Vector3, cost : int):
	
	Sprite_render.visible = condition
	if condition:
		Sprite_render.global_position = position 
		_show_cost_amount(cost)
		progress_bar.max_value = cost
		
func _show_cost_amount(cost : int):
	
	for c in visual_coins:
		c.visible = false
		
	for i in range(cost):
		visual_coins[i].visible = true

func update_coins_in(value): # when a coin is in the coin bar
	
	if _global_datas.zoneData:
		_for_DiveZone(value)
		return

	if _global_datas.Npc_Dialogue:
		_for_NpcZone(value)
		return
				
func _for_DiveZone(value):

	var limit_state = _global_datas.zoneData.purchass_state.size()
	if _global_datas.zoneData.purchass_index_state >= limit_state:
		return 
		 
	var cost = _global_datas.zoneData.purchass_state[_global_datas.zoneData.purchass_index_state].cost 
	
	# to show coins in bar
	if value <= cost: 	
		for i in range(value):
			visual_coins[i]._coin_in(true)
		
	# to end purchass
	if progress_bar.value > cost:
		var current_state = _global_datas.zoneData.purchass_index_state
		_global_datas.update_money_amount.emit(-cost)
		_global_datas.zoneData.purchass_state[current_state].purchass_done.emit()
		_global_datas.zoneData.purchass_index_state += 1
		_global_datas._check_boat_zone.emit()
		
		_reset_coins_bar()
	
func _for_NpcZone(value):
	
	if _global_datas.Npc_Dialogue.is_active:
		return 
		
	var cost = _global_datas.Npc_Dialogue.cost 
	# to show coins in bar
	if value <= cost: 	
		for i in range(value):
			visual_coins[i]._coin_in(true)
			
	# to end purchass
	if progress_bar.value > cost:
		_global_datas.update_money_amount.emit(-cost)
		_global_datas.Npc_Dialogue.purchass_done.emit()
		_global_datas.Npc_Dialogue.is_active = true
		_global_datas._check_boat_zone.emit()
	
		_reset_coins_bar()	
			
					
			
func _reset_coins_bar():
	
	for c in visual_coins:
			c._coin_in(false)
	progress_bar.value = 0
