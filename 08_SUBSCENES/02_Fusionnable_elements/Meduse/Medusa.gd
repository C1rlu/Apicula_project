extends Node

@onready var meduse_species_prefab = $".."

@export var enter_selected_tool : tool_data
@export var exit_selected_tool : tool_data

@export var oddity_prefab : PackedScene

var disable : bool = false

func _on_tree_exited():
	var on_position = meduse_species_prefab.position
	_global_datas.instance_scene_oddity.emit(oddity_prefab,3,on_position)
