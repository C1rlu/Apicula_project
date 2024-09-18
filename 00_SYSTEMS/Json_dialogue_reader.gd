extends Object
class_name dialogue_info_reader

func node_by_name(dialogie_data_path : String, info_node : String, ls) -> String :

	var json_as_text = FileAccess.get_file_as_string(dialogie_data_path)
	var json_as_dict = JSON.parse_string(json_as_text)
	var all_ls_info = json_as_dict
	return extract_dialogue(info_node,ls,all_ls_info)	
	
		
func extract_dialogue(node_name: String, ls : int, all_ls_info) -> String:
	for all_info in all_ls_info:
		if all_info["gnode_name"] == node_name:
			return all_info["commands_raw"].split("\n/\n")[ls] # here to select localisation note
	return "info not found"
