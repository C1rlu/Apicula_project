extends Node

@export var element_effect : _effect
func _on_area_3d_body_entered(body):
	if body:
		var player = body.get_node_or_null("Player_rg")
		
		if player:
			element_effect.trigger_effect()
