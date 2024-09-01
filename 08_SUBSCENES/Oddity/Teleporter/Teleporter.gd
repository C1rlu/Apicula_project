extends Node

@export var Vortex_visible_sate : Node
@onready var root = $".."
signal teleport_effect

@onready var mirror_sphere = $"../Mirror_sphere_msh/mirror_sphere"

func _teleport():
		
		
	#teleport_effect.emit()			
		
	if _global_datas.player_state == game_state.visible_state.normal:
		_global_datas.player_state = game_state.visible_state.mirror
		_global_datas.in_mirror_zone.emit()
		Vortex_visible_sate.show_mirror()
		return
		
	if _global_datas.player_state == game_state.visible_state.mirror:
		_global_datas.player_state = game_state.visible_state.normal
		_global_datas.in_mirror_zone.emit()
		
		Vortex_visible_sate.show_normal()
		return
	
func remove_teleporter():
	
	
	root.queue_free()
