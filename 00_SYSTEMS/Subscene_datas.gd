extends Node

# HERE FOR ALL SUBSCENE GLOBALS OF SUBSCENE

var player_max_amount : int = 5
var _current_player_depth : float = 0.0
signal _update_player_weight(amount : int)
signal _update_depth_ui

signal _kill_player

func _ready():
	_current_player_depth = 0.0

