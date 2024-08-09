extends Node


@onready var area_root = $"../ZoneCollide"
@onready var col = $"../ZoneCollide/CollisionShape3D"

func _ready():
	
	# for dialogue zone
	_global_datas._close_dialogue.connect(check_zone)
	_global_datas._open_dialogue.connect(close)
	
	

func close():
	
	_global_datas.in_dialogue_zone.emit(false)	
	_global_datas.go_darker_color.emit()
	


func check_zone():
	
	if !_global_datas.Player_InSubScene:
		return
	
	var all_area = area_root.get_overlapping_areas()
	for a in all_area:
		var npc_zone = a.get_node_or_null("Npc_zone")
		if npc_zone:
			
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit(true)
	

func _area_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:	
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas.in_dialogue_zone.emit(true)
			
	
func _area_exited(area_rid, area, area_shape_index, local_shape_index):
	

	if area:
		var npc_zone = area.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.in_dialogue_zone.emit(false)

			
	

