extends Node

@onready var element = $".."

@export var element_effect_list : Array[_effect]

@export var element_effect_On_exit : Array[_effect]
signal player_in(condition : bool)

@export var element_VFX : Array[GPUParticles3D]


func active_all_effect():
	for e in element_effect_list:
		e.trigger_effect(element)	
	
	
func active_all_exit_effect():
	for e in element_effect_On_exit:
		e.trigger_effect(element)	

func _on_area_3d_body_entered(body):
	
	if body:
		var player = body.get_node_or_null("Player_rg")
		if player:
			active_all_effect()
			player_in.emit(true)
			
			for e in element_VFX:
				e.emitting = true
		
func _on_area_3d_body_exited(body):
	if body:
		var player = body.get_node_or_null("Player_rg")
		if player:
			active_all_exit_effect()
			player_in.emit(false)
			
			for e in element_VFX:
				e.emitting = false
