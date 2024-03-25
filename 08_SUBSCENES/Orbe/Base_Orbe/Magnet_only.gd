extends Node

@onready var orbe_base_prefab = $"../.."

var active_magnet = false

func _ready():
	
	_global_datas._photo_flash.connect(_magnet_me)
	
	
func _magnet_me():
	active_magnet = true
			
func _process(delta):
	
	if !active_magnet:
		return

	_value(delta)	
			
func _value(delta):
	
	var player_position = _global_datas.subbscene_playerPosition #+ Vector3(0.0,0.3,0.0)	
	
	orbe_base_prefab.global_position = lerp(orbe_base_prefab.global_position,player_position, 8 * delta)			
	var distance = player_position.distance_to(orbe_base_prefab.position)
	
	if distance < 0.1:
		orbe_base_prefab.queue_free()
	
