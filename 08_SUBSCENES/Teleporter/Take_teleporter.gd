extends Node

@onready var teleporter = $"../../Teleporter"

@onready var teleporter_circle = $"../../teleporter_circle"
@onready var teleporter_circle_close = $"../../teleporter_circle_close"

func remove_teleporter():
	teleporter._remove_teleporter()

func _player_is_close(condition : bool):
	
	teleporter_circle.visible = !condition
	teleporter_circle_close.visible = condition


func _on_area_take_it_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var player = area.get_node_or_null("Player_photoActive")
		if player:
			_player_is_close(true)


func _on_area_take_it_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area:
		var player = area.get_node_or_null("Player_photoActive")
		if player:
			_player_is_close(false)
