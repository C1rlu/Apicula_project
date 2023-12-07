extends Button
class_name ChoiceButton 

var choice_index : int

signal choice_selected(choice_index)

func _on_pressed():
	choice_selected.emit(choice_index)
	
