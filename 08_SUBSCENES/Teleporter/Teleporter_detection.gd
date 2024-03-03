extends Node


@onready var timer = $Timer
@onready var timer_alarm = $Timer_Alarm
var closest_element 

var pulse = false


func _ready():
	_global_datas._backFrom_subscene.connect(_stop_sonar)
	
func _stop_sonar():
	timer.stop()

func _sonar():
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas._teleporter_list.size() == 0:
		
		return
			
	closest_element = _closest_element(_global_datas._teleporter_list)


func _closest_element(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	for element in array:

		var player_sub = _global_datas.subbscene_playerPosition
		
		var current_node_distance = player_sub.distance_to(element.teleporter_position)
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = element
			closest_node_distance = current_node_distance

	return closest_node

func _Alarm_pulse():
	
	pulse = !pulse
	$"../../Render_mesh/Sonar/01".visible = pulse
	$"../../Render_mesh/Sonar/02".visible = !pulse

	
func _on_timer_timeout():

	_sonar()	
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

