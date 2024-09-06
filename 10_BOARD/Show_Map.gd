extends Node

@export var On_Move : Node
func _ready():
	On_Move.On_Move.connect(_show_map)
	
	
func _show_map(condition : bool):
	if condition:
		_global_datas._open_player_map.emit(condition)	
