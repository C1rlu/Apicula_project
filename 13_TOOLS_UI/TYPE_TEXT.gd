extends Node


@onready var type_texte = $"../Type_texte"
@onready var list_of_choice = $"../List_of_choice"

@onready var button = $"../List_of_choice/Choice_button_prefab"

func _ready():
	_global_datas.type_text_mod.connect(type_text_mod)
	
	
func type_text_mod(condition : bool, note_data : Note_Data):
	#type_texte.visible = condition
	list_of_choice.visible = condition
	
	_global_datas.in_text_type_mod = condition
	_global_datas.responce_link_mode.emit(condition,"null")
	if condition:
		_global_datas._add_back_call.emit(back_call)
		button.grab_focus()
		#type_texte.grab_focus()	
		#type_texte.select()
	
		
func back_call():
	type_text_mod(false, null)

func _on_type_texte_text_submitted(new_text):
	_global_datas.type_text_mod.emit(false)
	_global_datas.selected_question.change_responce(new_text)


func _on_submit_text_pressed():
	_global_datas.type_text_mod.emit(false)
	
	_global_datas.selected_question.change_responce(type_texte.text)
