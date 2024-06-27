extends Button


func _on_pressed():
	
	_global_datas.type_text_mod.emit(false,null)
	_global_datas.selected_question.change_responce("my responce")
