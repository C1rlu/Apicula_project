extends Node

@export var orbe_name : String = ""
@onready var teleporter = $"../.."
@onready var teleporter_node = $"../../Teleporter"

var player_position 
var t 

var index : int 

func _magnet_me(condition:bool):
	
	if t:
		t.kill()
		
	if condition:
		player_position = _global_datas.subbscene_playerPosition	
		t = create_tween()		
		t.tween_method(_value,0.0,1.0,4.5)
	
func _value(value):
	
	player_position = _global_datas.subbscene_playerPosition	
	teleporter.global_position = lerp(teleporter.global_position,player_position,value)			
	#var distance = teleporter.global_position.distance_to(player_position)
	
	teleporter_node.magnet_end()
	#if distance < 0.1:
	#	done()	
	
func get_magnet_position():
	return 	teleporter.global_position
		
func done():
	_global_datas._remove_orbe_from_data.emit(orbe_name)
	teleporter.queue_free()
