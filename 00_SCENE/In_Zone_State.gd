extends Node

@export var area_root : Area3D


func _ready():
	
	_global_datas._check_zone_enter.connect(_check_zone_enter)	
	_global_datas._check_zone_exit.connect(_check_zone_exit)
	
	_global_datas._check_boat_zone.connect(check_zone)
	
	_global_datas._close_dialogue.connect(check_zone)
	_global_datas._backFrom_subscene.connect(check_zone)
	_global_datas.open_inventory.connect(_condition_check)
	_global_datas._open_menu.connect(_condition_check)
	
func _condition_check(condition):
	
	if !condition:	
		check_zone()	
	
func _check_zone_enter(area):
	
	var npc_zone = area.get_node_or_null("Npc_zone")
	if npc_zone:
		_global_datas.Npc_Dialogue = npc_zone.get_npc()
		_global_datas._active_this_npc_zone.emit(true)
		
	
	var boue_options = area.get_node_or_null("Boue_zone")
	if boue_options:
		print("In Dive Zone")
		var zone_data = boue_options.get_dive_data()
		_global_datas.zoneData = zone_data
		_global_datas._active_this_dive_zone.emit(true)		
	
func _check_zone_exit(area):
	
	var npc_zone = area.get_node_or_null("Npc_zone")
	if npc_zone:
		_global_datas._active_this_npc_zone.emit(false)
		_global_datas.Npc_Dialogue = null
		_global_datas._check_boat_zone.emit()
		
		
	var boue_options = area.get_node_or_null("Boue_zone")
	if boue_options:
		_global_datas._active_this_dive_zone.emit(false)
		_global_datas.zoneData = null
		_global_datas._check_boat_zone.emit()
		
		
func check_zone():
	
	
	var all_area = area_root.get_overlapping_areas()
	for a in all_area:
		var npc_zone = a.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas._active_this_npc_zone.emit(true)
			
		var boue_options = a.get_node_or_null("Boue_zone")
		if boue_options:
			var zone_data = boue_options.get_dive_data()
			_global_datas.zoneData = zone_data
			_global_datas._active_this_dive_zone.emit(true)
			
