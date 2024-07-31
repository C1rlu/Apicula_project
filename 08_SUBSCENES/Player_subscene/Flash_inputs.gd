extends Node

@onready var delay_light_timer = $Delay_light_timer
@onready var timer_mirror_check = $Loop_lighter

@onready var Mirror_scanner_area = $"../ZoneCollide"



func _ready():

	_global_datas._end_ini_subscene.connect(start_loop)
	_global_datas._backFrom_subscene.connect(stop_loop)
	
func start_loop():
	timer_mirror_check.start()	

func stop_loop():
	timer_mirror_check.stop()

			
func _start_light():

	if !delay_light_timer.is_stopped():
		return
	delay_light_timer.start()
	
	_global_datas._scan_mirror_xray.emit()
	_global_datas._photo_flash.emit()
	

func check_flash_zone():
	
	var all_Mirror_scanner_area = Mirror_scanner_area.get_overlapping_areas()
	
	if all_Mirror_scanner_area:
		for _areas in all_Mirror_scanner_area:

			var mirror_element = _areas.get_node_or_null("Mirror_element")
			if mirror_element:
				_start_light()			
				

func _on_loop_lighter_timeout():
	check_flash_zone()
	
