extends Node

@onready var teleporter = $"../.."
@export var orbe_type_data : orbe_data

var player_position 
var t 

var index : int 

func _magnet_me(condition:bool):
	
	if t:
		t.kill()
		
	if condition:
		player_position = _global_datas.subbscene_playerPosition	
		t = create_tween()		
		t.tween_method(_value,0.0,1.0,2.5)
	
func _value(value):
	
	player_position = _global_datas.subbscene_playerPosition	
	teleporter.global_position = lerp(teleporter.global_position,player_position,value)			
	var distance = teleporter.global_position.distance_to(player_position)
	if distance < 0.1:
		done()	
		
func done():
	#orbe_type_data.Orbe_scene_amount -= 1
	teleporter.queue_free()
