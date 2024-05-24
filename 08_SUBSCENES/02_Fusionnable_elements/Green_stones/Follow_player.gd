extends Node

@onready var root = $".."

var follow_player : bool = false

func _on_fusion_active_on_fusion(condition):
	#print("FOLLOW PLAYER", condition)	
		
	follow_player = condition
	
	
func _process(delta):
	
	if !follow_player:
		return
	
	var player_position = _global_datas._orbe_tool_origin_position
	root.position = lerp(root.position,player_position,6 * delta)
