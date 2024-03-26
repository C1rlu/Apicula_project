extends Node


@export var Render_on: Node3D
@export var Render_off: Node3D

func _on_orbe_contact_player_contact(condition):

	Render_on.visible = condition
	Render_off.visible =!condition	
