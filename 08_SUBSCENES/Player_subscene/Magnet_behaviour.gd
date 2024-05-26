extends Node


@export var fusion_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"

@onready var area_player = $"../ZoneCollide"
@onready var timer_process = $Timer_process

var disable : bool = true
func _ready():
	fusion_tool.tool_active_signal.connect(_check_area_process)	
	
func _check_area_process(condition):
	
	if disable:
		return
	if condition:
		print("check input")	
		timer_process.start()			
	else:
		timer_process.stop()
		if _global_datas.active_fusion_node_list.size() > 0:
			for f in _global_datas.active_fusion_node_list:
				if f != null:
					f._fusion(false)
			_global_datas.active_fusion_node_list.clear()	
	
	vfx_sphere_mirror.emitting = condition					

	
func check_process():

		
	if _global_datas.in_scanner_mode:
		return
		
		
	var overlap_areas_ = area_player.get_overlapping_areas()
	for areas in overlap_areas_:
		var fusion_node = areas.get_node_or_null("Fusion")
		if fusion_node:
			# need to check if node is alreay in list and add if not
			for node in _global_datas.active_fusion_node_list:
				if fusion_node == node:
					return
			#print(fusion_node, " fusion_node  is added to list ")	 	
			_global_datas.active_fusion_node_list.append(fusion_node)
			
	if _global_datas.active_fusion_node_list.size() > 0:
		for f in _global_datas.active_fusion_node_list:
			if f != null:
				f._fusion(true)
	
func _on_timer_process_timeout():
	check_process()

func _on_zone_collide_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var fusion = area.get_node_or_null("Fusion")
		if fusion:
			_global_datas.active_fusion_node_list.erase(fusion)	
			fusion._fusion(false)
			
