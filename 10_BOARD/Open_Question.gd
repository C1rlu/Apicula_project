extends Node

@onready var letter_area = $".."
@onready var n_text = $"../Text_render/text"

@onready var link_responce = $"../Link_responce"

signal On_click

func _on_on_click():
	
	_global_datas.selected_question = link_responce
	_global_datas.type_text_mod.emit(true)
	
	var offset = Vector3(0,0,-0.05)
	_global_datas.focus_this_on_board.emit(letter_area.position +offset)
	#_global_datas.question_node = letter_area	
	#_global_datas.responce_link_mode.emit(true,n_text.text)
