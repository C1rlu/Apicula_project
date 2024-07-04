extends Button
class_name ChoiceButton 

var choice_index : int

signal choice_selected(choice_index)

var actual_text_all


func _ready():
	
	_global_datas._change_language_state.connect(change_ls)
	actual_text_all = text

func change_ls(ls):
	
	if actual_text_all == "...":
		return
	var select_language_here = actual_text_all.split("/")
	
	if ls > select_language_here.size()-1:
		text  = "NO LOCALISATION HERE"
	else:
		var selected_words = select_language_here[ls]
		text  = selected_words
		
		
func _on_pressed():
	choice_selected.emit(choice_index)
	
