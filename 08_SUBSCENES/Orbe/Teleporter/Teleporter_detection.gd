extends Node

@onready var zone_collide = $"../../ZoneCollide"


@onready var timer_alarm = $Timer_Alarm
var pulse = false


func _ready():
	pass
	#_global_datas._mirror_switch.connect(check_at_switch)	
	

func check_at_switch(condition : bool):
		
	if !condition:		
		timer_alarm.stop()
		$"../../Render_mesh/Sonar/01".visible = false
		$"../../Render_mesh/Sonar/02".visible = false
		return
		
	var overlap_areas_ = zone_collide.get_overlapping_areas()
	
	if overlap_areas_ == null:	
		return

	for areas in overlap_areas_:
		var element = areas.get_node_or_null("Teleporter")
		if element:
			_global_datas._teleporter_list.append(element)
			timer_alarm.start()
		
		
func _Alarm_pulse():
	
	pulse = !pulse
	$"../../Render_mesh/Sonar/02".visible = pulse
	$"../../Render_mesh/Sonar/01".visible = !pulse

func _on_timer_alarm_timeout():
	_Alarm_pulse()


func _on_zone_collide_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if !_global_datas.Player_InMirrorScene:
		return
		
	var element = area.get_node_or_null("Teleporter")
	if element:
		_global_datas._teleporter_list.append(element)
		timer_alarm.start()
		
func _on_zone_collide_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
		
	if area == null:
		return

	var element = area.get_node_or_null("Teleporter")
	if element:
		_global_datas._teleporter_list.erase(element)	
	

	if _global_datas._teleporter_list.size() == 0:
		timer_alarm.stop()
		$"../../Render_mesh/Sonar/01".visible = false
		$"../../Render_mesh/Sonar/02".visible = false

