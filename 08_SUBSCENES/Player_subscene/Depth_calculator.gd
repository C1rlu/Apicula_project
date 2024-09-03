extends Node

@export var Player_rg : RigidBody3D


func _process(delta):
	
	if _global_datas.Player_InSubScene:
		update_depth_value()
		
	
func update_depth_value():
	
	#var current_depth = Player_rg.position.y.distance_to(Vector3.ZERO.y)
	var current_depth = abs(Player_rg.position.y - Vector3.ZERO.y - 0.5)
	_subscene_datas._current_player_depth = current_depth
	_subscene_datas._update_depth_ui.emit()
	
