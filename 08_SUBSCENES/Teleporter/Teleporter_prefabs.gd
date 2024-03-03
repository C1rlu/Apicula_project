extends Node
@onready var teleporter = $".."

var teleporter_position : Vector3

func _ready():

	teleporter_position = teleporter.position
	
func _remove_teleporter():
	_global_datas.teleporter_amount -=1
	teleporter.queue_free()	
	
