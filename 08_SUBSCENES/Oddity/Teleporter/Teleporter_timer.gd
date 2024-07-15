extends Node

@onready var timer = $Timer
@onready var root = $".."
@onready var area = $"../Area3D"

signal teleport_effect

func _ready():
	timer.start()
	
func _teleport():
	
	_global_datas.is_in_mirror_zone =! _global_datas.is_in_mirror_zone
	_global_datas.in_mirror_zone.emit(_global_datas.is_in_mirror_zone)

func check_teleporter_area():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			var player = areas.get_node_or_null("Player")
			if player :
				_teleport()
				_global_datas.subscene_sonar_effect.emit(root.global_position)
					
func _on_timer_timeout():

	teleport_effect.emit()


func _on_vortex_effect_check_teleporter():
	check_teleporter_area()
