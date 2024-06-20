extends Node


@onready var type_texte = $"../Type_texte"



func _ready():
	_global_datas.type_text_mod.connect(type_text_mod)
	
	
func type_text_mod(condition : bool):
	type_texte.visible = condition
	_global_datas.in_text_type_mod = condition
	
	if condition:
		_global_datas._add_back_call.emit(back_call)
		type_texte.grab_focus()	
		type_texte.select()

func back_call():
	type_text_mod(false)

func _on_type_texte_text_submitted(new_text):
	_global_datas.type_text_mod.emit(false)
	_global_datas.selected_question.change_responce(new_text)
