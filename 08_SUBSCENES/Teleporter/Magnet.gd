extends Node

@onready var teleporter = $"../.."
@export var orbe_type_data : orbe_data

var player_position 
var t 

var index : int 

func _magnet_me(condition:bool):
	
	#if t:
		#t.kill()
		
	if condition:
		switch_orbe_type_data()
	
		player_position = _global_datas.subbscene_playerPosition		
		
		#t = create_tween()		
		#t.tween_method(_value,0.0,1.0,2.5)

func switch_orbe_type_data():
	
	index += 1
	
	if index == _global_datas._orbe_type_list.size():
		index = 0
				
	var orbe_selected_data = _global_datas._orbe_type_list[index]
	set_orbe_type(orbe_selected_data)
	

func set_orbe_type(orbe_type : orbe_data):
	orbe_type_data = orbe_type	
	_global_datas._update_orbe_ui_type.emit(orbe_type)
	print(orbe_type.Orbe_kind,"is selected")
	
	
func _value(value):
	
	player_position = _global_datas.subbscene_playerPosition	
	teleporter.global_position = lerp(teleporter.global_position,player_position,value)			
	var distance = teleporter.global_position.distance_to(player_position)
	if distance < 0.1:
		done()	
		
func done():
	_global_datas.teleporter_amount -=1
	teleporter.queue_free()
