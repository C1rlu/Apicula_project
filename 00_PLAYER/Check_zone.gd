extends Node

@onready var area_root = $"../Enter_dialogue_zone"


func _ready():
	
	# for dialogue zone
	_global_datas._close_dialogue.connect(check_zone)
	_global_datas._open_dialogue.connect(close)
	
	_global_datas.open_inventory.connect(check_condition)
	_global_datas._open_menu.connect(check_condition)
	_global_datas.wait_in_time.connect(close)
	
	# for diving zone
	_global_datas._backFrom_subscene.connect(check_zone)
	_global_datas._go_Subscene.connect(close)
	
	
func close():
	_global_datas.out_dialogue_zone.emit()	
	_global_datas._show_object_legend.emit(false,"")	
	
		
func check_condition(condition: bool):
	 
	if _global_datas.Waiting_bird:
		return
		
	if !condition:
		check_zone()	
	else:
		_global_datas.out_dialogue_zone.emit()	
		_global_datas._show_object_legend.emit(false,"")
		
		
func check_zone():
	
	var all_area = area_root.get_overlapping_areas()
	for a in all_area:
		var npc_zone = a.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit()
			
			_global_datas._show_object_legend.emit(true,_global_datas.Npc_Dialogue.name)

		var dive_zone = a.get_node_or_null("Dive_zone")
		if dive_zone:
			dive_zone.On_Over(true)
			var dive_data = dive_zone.get_dive_data()
			_global_datas.selected_subscene = dive_data.zone_packed_scene
			_global_datas._show_object_legend.emit(true,dive_data.legend)	
		
func _on_enter_dialogue_zone_area_entered(area):
	
	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:	
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit()
			_global_datas._show_object_legend.emit(true,_global_datas.Npc_Dialogue.zone_name)
	
		var dive_zone = area.get_node_or_null("Dive_zone")
		if dive_zone:
			dive_zone.On_Over(true)
			var dive_data = dive_zone.get_dive_data()
			_global_datas.selected_subscene = dive_data.zone_packed_scene
			_global_datas._show_object_legend.emit(true,dive_data.legend)		
			
			
func _on_enter_dialogue_zone_area_exited(area):
	
	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.Npc_Dialogue = null
			_global_datas.out_dialogue_zone.emit()
			_global_datas._show_object_legend.emit(false,"")
	
		var dive_zone = area.get_node_or_null("Dive_zone")
		if dive_zone:
			dive_zone.On_Over(false)
			_global_datas.selected_subscene = null
			_global_datas._show_object_legend.emit(false,"")	
