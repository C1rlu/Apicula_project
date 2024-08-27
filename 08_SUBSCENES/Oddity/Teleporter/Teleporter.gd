extends Node

@export var vortex_tool : tool_data

@onready var root = $".."

signal teleport_effect


func _teleport():
		
	if _global_datas.player_state == game_state.visible_state.normal:
		_global_datas.player_state = game_state.visible_state.mirror
		_global_datas.in_mirror_zone.emit()
		#root.queue_free()
		return
		
	if _global_datas.player_state == game_state.visible_state.mirror:
		_global_datas.player_state = game_state.visible_state.normal
		_global_datas.in_mirror_zone.emit()
		
		remove_teleporter()	
		return
		
func remove_teleporter():
	
	
	root.queue_free()
func _on_area_3d_teleport_area_entered(area):
	

	if area:
		var player = area.get_node_or_null("Player")
		if player :
			_teleport()
			#_global_datas.subscene_sonar_effect.emit(root.global_position)
			teleport_effect.emit()	
		#
		#var element = area.get_node_or_null("Switch_mirror")
		#if element:
			#_global_datas.subscene_sonar_effect.emit(root.global_position)
			#element.switch()	
			#teleport_effect.emit()
