extends Control

@onready var choice_button_scn = preload("res://11_SPEAKER/Dialogue/Dialogue_asset/Choice_button.tscn")
var choice_buttons : Array[Button] = []
@onready var text_node = $Dialogue_text

@onready var v_box_container = $Dialogue_text/VBoxContainer



var is_dialogue_done = false
var actual_index : int
#func _ready():
	
	#_global_datas._change_language_state.connect(reload_state)


func clear_dialogue_box():
	text_node.text = ""

	for choice in choice_buttons:
		v_box_container.remove_child(choice)
	choice_buttons = []	
	
func add_text(text : String):
	text_node.text  = text
	var text_count = text.length()
	_global_datas._type_text.emit(text_count)
	
func add_choice(choice_text : String):
	var button_obj: ChoiceButton = choice_button_scn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	button_obj.move_to_front()
	v_box_container.add_child(button_obj)
	button_obj.visible = false

func show_all_responce():
	
	var choice = v_box_container.get_children()
	if !choice:
		return
	for c in choice:
		c.visible = true
		
	choice[0].grab_focus()

func _on_choice_selected(choice_index : int):
	
	if !is_dialogue_done:
		($"../../../Dialogue/EzDialogue" as EzDialogue).next(choice_index)	
		actual_index = choice_index
	else:
		clear_dialogue_box()	

func _on_dialogue_typing_text_type_done():
	show_all_responce()
	

