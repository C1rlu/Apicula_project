extends Node

@export var Map_node : Control

func _ready():
	_global_datas._open_player_map.connect(_open_map)
	Map_node.visible = false
	
	
func _open_map(condition : bool):
	Map_node.visible = condition	
	print(" Open map", condition)
