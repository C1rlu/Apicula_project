extends Object
class_name board_info_reader

func node_by_name(info : info_data, ls) -> String :
	
	var BOARD_INFO = "res://15_GAME_RESSOURCE/02_BOARD_INFO/Board_Info.json"	
	var json_as_text = FileAccess.get_file_as_string(BOARD_INFO)
	var json_as_dict = JSON.parse_string(json_as_text)
	
	var all_ls_info = json_as_dict
		
	if info == null:
		return "null"
	return extract_dialogue(info.info_node_name,ls,all_ls_info)	
	
		
func extract_dialogue(node_name: String, ls : int, all_ls_info) -> String:
	for all_info in all_ls_info:
		if all_info["gnode_name"] == node_name:
			return all_info["commands_raw"].split("\n/\n")[ls] # here to select localisation note
	return "info not found"
