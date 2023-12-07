extends Node2D

@onready var choice_button_scn = preload("res://11_SPEAKER/Dialogue/Dialogue_asset/Choice_button.tscn")

var choice_buttons : Array[Button] = []
@onready var text_node = $VBoxContainer/Dialogue_text

@onready var v_box_container = $VBoxContainer

var is_dialogue_done = false

func _ready():

	pass
	
	
func clear_dialogue_box():
	text_node.text = ""
	
	for choice in choice_buttons:
		v_box_container.remove_child(choice)
	choice_buttons = []	
func add_text(text : String):
	text_node.text  = text


func add_choice(choice_text : String):
	var button_obj: ChoiceButton = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	
	v_box_container.add_child(button_obj)
	

func _on_choice_selected(choice_index : int):
	print(choice_index)
	if !is_dialogue_done:
		($"../../../Dialogue/EzDialogue" as EzDialogue).next(choice_index)	
	else:
		clear_dialogue_box()	




