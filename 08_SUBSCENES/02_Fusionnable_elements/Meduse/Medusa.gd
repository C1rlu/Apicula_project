extends Node

@onready var meduse_species_prefab = $".."

@export var enter_selected_tool : tool_data
@export var exit_selected_tool : tool_data

@export var follower_oddity : Oddity_scene_data


var disable : bool = false

func _on_tree_exited():
	var on_position = meduse_species_prefab.position
	_global_datas.instance_scene_oddity.emit(follower_oddity,1,on_position)
