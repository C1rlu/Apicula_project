extends Node

@onready var meduse_species_prefab = $".."

@export var enter_selected_tool : tool_data
@export var exit_selected_tool : tool_data

var disable : bool = false
func remover():
	
	meduse_species_prefab.queue_free()	
	

func _player_body_entered(body):
	if disable:
		return
	if body:
		var is_player = body.get_node_or_null("Player")
		if is_player:
			#print("PLAYER IS HERE")
			#_global_datas.switching_tool.emit(enter_selected_tool)
			_global_datas.player_is_Interactive_Zone = true
			
func _player_body_exited(body):
	if disable:
		return
	if body:
		var is_player = body.get_node_or_null("Player")
		if is_player:
			#print("OUT PLAYER")
			#_global_datas.switching_tool.emit(exit_selected_tool)
			_global_datas.player_is_Interactive_Zone = false
