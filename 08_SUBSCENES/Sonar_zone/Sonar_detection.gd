extends Node

@onready var player_sub = $".."
@onready var timer = $Timer
@onready var timer_alarm = $Timer_Alarm
var closest_element 
var pulse = false
func _ready():
	_global_datas._go_Subscene.connect(_start_sonar)
	_global_datas._backFrom_subscene.connect(_stop_sonar)

func _start_sonar():
	timer.start()	
func _stop_sonar():
	timer.stop()
	timer_alarm.stop()

func _sonar():
	
	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Element_sub_zone_array.size() == 0:
		
		return
			
	closest_element = _closest_element(_global_datas.Element_sub_zone_array,player_sub.position)
	


	
func _closest_element(array, point):
	
	var closest_node = null
	var closest_node_distance = 0.0
	for element in array:

		# fade in distance
		var distance = player_sub.position.distance_to(element._position())
		var lerp_opa = lerpf(0.4,0.0,distance)
		element._change_opacity(lerp_opa)
		
		var current_node_distance = point.distance_to(element._position())
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = element
			closest_node_distance = current_node_distance
	
	return closest_node

func _update_sonar_Alarm():
	
	
	if closest_element == null:
		return
		
	var distance = player_sub.position.distance_to(closest_element._position())
	
	var lerp = lerpf(0.05,1.0,distance/5)
	timer_alarm.wait_time = lerp

func _Alarm_pulse():
	
	pulse = !pulse
	$"../Render_mesh/Sonar/01".visible = pulse
	$"../Render_mesh/Sonar/02".visible = !pulse


func _on_sonar_zone_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):


	var element = area.get_node_or_null("Go_player")
	if element:
		_global_datas.Element_sub_zone_array.append(element)

		# to stop the alarm
	if _global_datas.Element_sub_zone_array.size() > 1:
		if timer_alarm.is_stopped():	
			timer_alarm.start()

	
func _on_sonar_zone_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	

	if area == null:
		return
	
	var element = area.get_node_or_null("Go_player")
	if element:
		_global_datas.Element_sub_zone_array.erase(element)	
		
	# to stop the alarm
	if _global_datas.Element_sub_zone_array.size() == 0:
		timer_alarm.stop()	
		$"../Render_mesh/Sonar/01".visible = true
		$"../Render_mesh/Sonar/02".visible = false
		
func _on_timer_timeout():
	
	
	_sonar()	
	_update_sonar_Alarm()


func _on_timer_alarm_timeout():
	_Alarm_pulse()
