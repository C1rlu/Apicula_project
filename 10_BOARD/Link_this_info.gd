extends Node


@onready var _text = $"../../legend_render/text"


func _link_info():
	#var focus = _global_datas.question_node.position
	#_global_datas.focus_this_on_board.emit(focus)
	_global_datas.responce_chose.emit(_text.text)
	#_global_datas.responce_link_mode.emit(false,"null")		
	
