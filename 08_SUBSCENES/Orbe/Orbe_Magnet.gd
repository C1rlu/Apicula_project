extends Node

@export var orbe_name : String = ""
@onready var teleporter = $"../.."

var player_position 
var t 

var index : int 
var active_magnet : bool

signal magnet_end



func _magnet_me(condition:bool):
	active_magnet = condition
			
func _process(delta):
	
	if !active_magnet:
		return

	_value(delta)	
			
func _value(delta):
	
	player_position = _global_datas.subbscene_playerPosition + Vector3(0.0,0.3,0.0)	
	
	teleporter.global_position = lerp(teleporter.global_position,player_position, 4 * delta)			
	magnet_end.emit()
	
func get_magnet_position():
	return 	teleporter.global_position
		
