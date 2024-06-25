extends Node

@onready var letter_area = $".."
@onready var n_text = $"../Text_render/text"

signal On_click

func _on_on_click():
	pass
	#_global_datas.question_node = letter_area	
	#_global_datas.responce_link_mode.emit(true,n_text.text)
