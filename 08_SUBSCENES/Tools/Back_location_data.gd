extends Node


@export var location : location_data

func _on_photo_data_scaning_done():
	location.location_state = game_state.visible_state.normal
