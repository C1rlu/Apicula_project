extends Node

@export var element_effect_list : Array[_effect]


func active_all_effect():
	for e in element_effect_list:
		e.trigger_effect()	

func _on_area_3d_body_entered(body):
	
	
	if body:
		var player = body.get_node_or_null("Player_rg")
		if player:
			active_all_effect()


