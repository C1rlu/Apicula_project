extends Node


@onready var _text = $"../../legend_render/text"


func _link_info():
	_global_datas.responce_chose.emit(_text.text)
	
	
