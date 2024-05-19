extends Node


@export var fusion_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"

@onready var area = $"../ZoneCollide"
@onready var timer_process = $Timer_process

var active_fusion_node_list : Array

func _ready():
	fusion_tool.tool_active_signal.connect(_check_area_process)	
	
func _check_area_process(condition):
	
	if condition:
		timer_process.start()			
	else:
		timer_process.stop()
		if active_fusion_node_list.size() > 0:
			for f in active_fusion_node_list:
				if f != null:
					f._fusion(false)
			active_fusion_node_list.clear()	
		
	vfx_sphere_mirror.emitting = condition					

	
func check_process():

		
	if _global_datas.in_scanner_mode:
		return
		
	var overlap_areas_ = area.get_overlapping_areas()
	
	for areas in overlap_areas_:
	
		var fusion_node = areas.get_node_or_null("Fusion")
		if fusion_node:
			active_fusion_node_list.append(fusion_node)
			
	if active_fusion_node_list.size() > 0:
		for f in active_fusion_node_list:
			if f != null:
				f._fusion(true)


	
				
func _on_timer_process_timeout():
	check_process()
