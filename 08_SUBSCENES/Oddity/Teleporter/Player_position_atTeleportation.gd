extends Node

@onready var teleporter_prefab = $".."
@onready var timer = $Timer
@onready var explose_part = $"../Explose_part"

func _ready():
	if _global_datas.teleportation_active:	
		var player_rg = _global_datas.player_rg 
		player_rg.global_position = teleporter_prefab.global_position + Vector3(0,-0.15,0)
		
		player_rg.linear_velocity = Vector3.ZERO
		timer.start()
		explose_part.emitting = true
		#_global_datas.subscene_sonar_effect.emit(teleporter_prefab.global_position)

		
func _on_timer_timeout():
	_global_datas.teleportation_active = false
