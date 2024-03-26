extends Node

@onready var teleporter = $".."

func _on_orbe_contact_delete_node():
	teleporter.queue_free()	
