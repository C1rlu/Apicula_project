extends Node


@onready var area_root = $"../Enter_dialogue_zone"
@onready var col = $"../Enter_dialogue_zone/Col"

func _ready():
	
	# for dialogue zone
	_global_datas._close_dialogue.connect(check_zone)
	_global_datas._open_dialogue.connect(close)
	
	_global_datas.open_inventory.connect(close_for_menu)

	# for diving zone
	_global_datas._backFrom_subscene.connect(check_zone)
	_global_datas._go_Subscene.connect(close)

	

func close():
	_global_datas.in_dialogue_zone.emit(false)	

	_global_datas._show_object_legend.emit(false,null)	
	_global_datas.go_darker_color.emit()
	
func close_for_menu(condition):
	
	if condition:
		_global_datas.in_dialogue_zone.emit(false)
		_global_datas._show_object_legend.emit(false,null)		
	else:
		
		if _global_datas.Player_In_Inventory:
			return
		if _global_datas.Player_InSubScene:
			return
		check_zone()	
		
	col.disabled = condition
	

func check_zone():
	
	var all_area = area_root.get_overlapping_areas()
	for a in all_area:
		var npc_zone = a.get_node_or_null("Npc_zone")
		if npc_zone:
			
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit(true)
			var actual_zone_name = _global_datas.Npc_Dialogue.zone_info_name
			_global_datas._show_object_legend.emit(true,actual_zone_name)

		var dive_zone = a.get_node_or_null("Dive_zone")
		if dive_zone:

			dive_zone._contact.emit(true)
			var dive_data = dive_zone.get_dive_data()
			_global_datas.selected_subscene = dive_data.zone_packed_scene
			var zone_info = dive_data.info
			_global_datas._show_object_legend.emit(true,zone_info)		
		
func _on_enter_dialogue_zone_area_entered(area):
	
	
	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:	
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit(true)
	
			var actual_zone_name = _global_datas.Npc_Dialogue.zone_info_name
			_global_datas._show_object_legend.emit(true,actual_zone_name)
	
		var dive_zone = area.get_node_or_null("Dive_zone")
		if dive_zone:
	
			dive_zone._contact.emit(true)
			var dive_data = dive_zone.get_dive_data()
			_global_datas.selected_subscene = dive_data.zone_packed_scene
			var zone_info = dive_data.info
			_global_datas._show_object_legend.emit(true,zone_info)		
			
			
func _on_enter_dialogue_zone_area_exited(area):
	

	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.in_dialogue_zone.emit(false)
			_global_datas._show_object_legend.emit(false,null)
			
		var dive_zone = area.get_node_or_null("Dive_zone")
		if dive_zone:
		
			dive_zone._contact.emit(false)
			_global_datas.selected_subscene = null
			_global_datas._show_object_legend.emit(false,null)	
			_global_datas._active_progress_subscene.emit(false)
