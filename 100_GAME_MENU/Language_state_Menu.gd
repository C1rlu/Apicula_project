extends Node

@onready var language_choice = $"../Game_Menu_Root/MainMenu_Box/Language_choice"

func _ready():
	add_items()
	
func add_items():
	language_choice.add_item("English")	
	language_choice.add_item("Français")	

	
func _on_language_choice_item_selected(index):

	_global_datas._change_language_state.emit(index)
