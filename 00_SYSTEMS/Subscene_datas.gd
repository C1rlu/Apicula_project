extends Node

# HERE FOR ALL SUBSCENE GLOBALS OF SUBSCENE


signal go_subscene(condition : bool)
var player_in_subscene : bool 
# related to depth
var _current_player_depth : float = 0.0
signal _update_depth_ui
signal _kill_player

# related to weigh 
var player_max_amount : int = 5
signal _update_player_weight(amount : int)
var list_of_magnetable : Array

#related to collectible

signal _add_collect_element(element : element_data)
signal _remove_collect_element(element : element_data)


func _ready():
	_current_player_depth = 0.0

	
