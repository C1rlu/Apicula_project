extends Node

var active : bool = true

signal player_contact(condition : bool)

signal delete_node

func _on_area_take_it_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if !active:
		return
		
	if area:
		var player = area.get_node_or_null("Player_photoActive")
		if player:
			player_contact.emit(true)


func _on_area_take_it_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if !active:
		return
		
	if area:
		var player = area.get_node_or_null("Player_photoActive")
		if player:
			player_contact.emit(false)
	
