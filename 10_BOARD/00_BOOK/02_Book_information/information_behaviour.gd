extends Node

@export var info_text : Label
@export var information : info_data

var ls_index : int = 0
func _ready():
	
	var all_info = get_children()
	
	if	information:
		if information.is_discovered:
			for a in all_info:
				a.visible = true
		else:
			for a in all_info:
				a.visible = false		
	change_text()	
	_global_datas._change_language_state.connect(update_ls)
	
func update_ls(ls):
	ls_index = ls
	change_text()	
	
					
func change_text():

	if info_text:
		var info_reader = board_info_reader.new()
		var text_info = info_reader.node_by_name(information,ls_index)
		info_text.text = text_info		
