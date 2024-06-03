extends Node


var show_only_map : bool = false

func _show_only_map():
	show_only_map =!show_only_map
	
	if show_only_map:
		_global_datas.photo_fade_in.emit()
	else:
		_global_datas.photo_fade_out.emit()
