extends Node
@onready var root = $"../.."


@onready var area = $".."


func check_mirror():
	

	var all_areas = area.get_overlapping_areas()
	
	for a in all_areas:
		var mirror_element = a.get_node_or_null("In_Mirror")	
	
		if mirror_element:
			if mirror_element.out_of_mirror:
				return
			mirror_element.start_exit()
			_global_datas.subscene_sonar_effect.emit(root.global_position)
