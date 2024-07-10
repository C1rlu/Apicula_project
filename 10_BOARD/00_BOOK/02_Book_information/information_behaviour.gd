extends Node


@export var information : info_data

func _ready():
	
	var all_info = get_children()
	
	if	information:
		if information.is_discovered:
			for a in all_info:
				a.visible = true
		else:
			for a in all_info:
				a.visible = false		
