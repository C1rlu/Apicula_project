extends Node

@onready var _collect = $".."

@export var Debris : Node



func _ready():
	Debris.push_to_player.connect(push_to_player)
	
	
	
	
func push_to_player():
	
	var distance = _global_datas.subbscene_playerPosition.distance_to(_collect.position)
	print(distance)
	if distance > 1.0:
		return
	var direction = (_global_datas.subbscene_playerPosition - _collect.position).normalized()
	_collect.apply_central_force(direction * 5)
	
	
	#print("Push to player")	
