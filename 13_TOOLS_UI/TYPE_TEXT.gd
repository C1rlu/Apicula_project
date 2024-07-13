extends Node


func _ready():
	_global_datas.type_text_mod.connect(type_text_mod)
	
func type_text_mod(condition : bool, note_data : Note_Data):
	#type_texte.visible = condition
	#list_of_choice.visible = condition
	
	_global_datas.in_text_type_mod = condition
	_global_datas.responce_link_mode.emit(condition,"null")
	if condition:
		_global_datas._add_back_call.emit(back_call)
		
		
func back_call():
	type_text_mod(false, null)

func _on_type_texte_text_submitted(new_text):
	_global_datas.type_text_mod.emit(false)
	_global_datas.selected_question.change_responce(new_text)

