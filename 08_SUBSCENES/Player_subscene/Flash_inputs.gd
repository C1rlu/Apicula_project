extends Node


@onready var area = $"../ZoneCollide"
@onready var timer = $Timer


@export var flash_tool_data : tool_data

func _ready():

	flash_tool_data.tool_active_signal.connect(_start_light)	
	#_global_datas._end_ini_subscene.connect(_start_light)

func _start_light(condition):
	
	if !condition:
		return
		
	if !timer.is_stopped():
		return
		
	timer.start()
	check_area(true)	
		
	
						
func check_area(condition : bool):
	

	if _global_datas.in_scanner_mode:
		return
	if !condition:
		return
	
	#_global_datas._scan_mirror_xray.emit()
	_global_datas._photo_flash.emit()
	_global_datas.flash_x_ray_oddity.emit()
	#var overlap_areas_ = area.get_overlapping_areas()
	#
	#if overlap_areas_ == null:
		#return
		#
	#for areas in overlap_areas_:
	#
		#var mirror_node = areas.get_node_or_null("Mirror")
		#var mirror_destination = areas.get_node_or_null("Mirror_destination")
		#
		#if mirror_destination:
			#if _global_datas.Player_InMirrorScene:
				#var desination = mirror_destination.destination
				#if desination:
					#_global_datas._load_mirror_subscene.emit(desination)
					#return
	#
		#if mirror_node:
			#if !_global_datas.Player_InMirrorScene:		
				#_global_datas._mirror_switch.emit(true)
			#else:
				#_global_datas._mirror_switch.emit(false)	
	
					
func _on_timer_timeout():
	timer.start()
	check_area(true)
