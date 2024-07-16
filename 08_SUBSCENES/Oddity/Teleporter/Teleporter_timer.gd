extends Node

@onready var timer = $Timer
@onready var root = $".."
@onready var area = $"../Area3D"

signal teleport_effect

func _ready():
	timer.start()
	
func _teleport():
		
	if _global_datas.player_state == game_state.visible_state.normal:
		_global_datas.player_state = game_state.visible_state.mirror
		_global_datas.in_mirror_zone.emit()
		return
		
	if _global_datas.player_state == game_state.visible_state.mirror:
		_global_datas.player_state = game_state.visible_state.normal
		_global_datas.in_mirror_zone.emit()	
		return

func check_teleporter_area():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			var player = areas.get_node_or_null("Player")
			if player :
				_teleport()
				_global_datas.subscene_sonar_effect.emit(root.global_position)
				
				
			var element = areas.get_node_or_null("Switch_mirror")
			if element:
				_global_datas.subscene_sonar_effect.emit(root.global_position)
				element.switch()	
					
func _on_timer_timeout():

	teleport_effect.emit()


func _on_vortex_effect_check_teleporter():
	check_teleporter_area()
