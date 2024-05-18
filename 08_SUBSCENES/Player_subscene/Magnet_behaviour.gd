extends Node


@export var fusion_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"

@onready var area = $"../ZoneCollide"
@onready var timer_process = $Timer_process
var active_fusion_node

func _ready():
	fusion_tool.tool_active_signal.connect(_check_area_process)	
	#fusion_tool.cancel_action_signal.connect(disable)	
	

func _check_area_process(condition):
	
	if condition:
		timer_process.start()			
	else:
		
		timer_process.stop()
		if active_fusion_node != null:
			active_fusion_node._fusion(false)
			active_fusion_node = null			
			
	vfx_sphere_mirror.emitting = condition					

	
func check_process():

		
	if _global_datas.in_scanner_mode:
		return
	var overlap_areas_ = area.get_overlapping_areas()
	
	#if overlap_areas_ == null:
		#return
		
	for areas in overlap_areas_:
	
		var fusion_node = areas.get_node_or_null("Fusion")
		if fusion_node:
			active_fusion_node = fusion_node
			fusion_node._fusion(true)
			return
				
	if active_fusion_node != null:
				active_fusion_node._fusion(false)
				active_fusion_node = null		
				
func _on_timer_process_timeout():
	check_process()
