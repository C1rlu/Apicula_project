extends Node

@onready var letter_area = $".."

@onready var responce = $"../Text_responce/ColorRect/responce"
@onready var n_text = $"../Text_render/text"




var t 
func _open_question():

	#var position = letter_area.position
	#_global_datas.start_choice.emit(true,position)
	#var offset = Vector3(0.00,0.0,-0.07)
	#var focus = position +  offset
	#_global_datas.focus_this_on_board.emit(focus)
	#_global_datas.selected_question = self
	
	#_global_datas.type_text_mod.emit(true)
	
	_global_datas.question_node = letter_area
	_global_datas.responce_link_mode.emit(true,n_text.text)
	
	

func change_responce(responce_text : String):
	responce.text = responce_text
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(change_ratio,0.0,1.0,0.5)

func change_ratio(value : float):

	responce.visible_ratio = value	
