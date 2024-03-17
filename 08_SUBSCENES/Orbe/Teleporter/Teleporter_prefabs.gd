extends Node
@onready var teleporter = $".."

var teleporter_position : Vector3

func _ready():
	teleporter_position = teleporter.position

func _remove_teleporter():
	teleporter.queue_free()	

func set_position(_position : Vector3):
	teleporter.position = _position	
	teleporter_position = teleporter.position

func magnet_end():
	var player_position = _global_datas.subbscene_playerPosition	
	teleporter_position = player_position	


func _on_orbe_magnet_magnet_end():
	magnet_end()
