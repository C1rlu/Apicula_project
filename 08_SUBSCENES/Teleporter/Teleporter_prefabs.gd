extends Node
@onready var teleporter = $".."

var teleporter_position : Vector3

func _ready():

	teleporter_position = teleporter.position
	
func _remove_teleporter():
	teleporter.queue_free()	
	
