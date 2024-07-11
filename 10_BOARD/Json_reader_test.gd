extends Node

@export var info : info_data

var BOARD_INFO = "res://15_GAME_RESSOURCE/02_BOARD_INFO/Board_Info.json"
var all_ls_info = []
var ls : int = 0 

func _ready():
	
	_global_datas._change_language_state.connect(update_ls)
	
	
	var json_as_text = FileAccess.get_file_as_string(BOARD_INFO)
	var json_as_dict = JSON.parse_string(json_as_text)
	
	all_ls_info = json_as_dict
	
	print(extract_dialogue(info.info_node_name))

func update_ls(ls_value):
	ls = ls_value	
	print(extract_dialogue(info.info_node_name))
	
		
func extract_dialogue(node_name: String) -> String:
	for all_info in all_ls_info:
		if all_info["gnode_name"] == node_name:
			return all_info["commands_raw"].split("\n/\n")[ls] # here to select localisation note
	return "info not found"
