extends  Node


@onready var dialogue_box = $"../00_NPC_CREATOR/Npc_convas/Dialogue_box"

signal close_dialogue_only # already out of dialogue zones

@onready var state = {
	"close_dialogue_only" : close_dialogue_only,
	"show_only_one": false,
	"player_name": "Baltazar",
	"some_variable" : 0,
	"hand_signal" : _global_datas._show_hand,
	"hide_hand_signal" : _global_datas._hide_hand,
	"give_letter" : _global_datas._bird_give_letter,	
	"give_tool" : _global_datas.player_received_ui_tool
}

func _ready():
	_global_datas._open_dialogue.connect(_open_dialogue)
	
func _open_dialogue():
	dialogue_box.is_dialogue_done = false
	var dialogue = _global_datas.Npc_Dialogue.Dialogue_data
	($EzDialogue as EzDialogue).start_dialogue(dialogue, state,'start')

func _on_ez_dialogue_dialogue_generated(response):

	dialogue_box.clear_dialogue_box()
	dialogue_box.add_text(response.text)
	
	if response.choices.is_empty():
		dialogue_box.add_choice("...")	
	
	for choice in response.choices:
		dialogue_box.add_choice(choice)


func _on_ez_dialogue_custom_signal_received(value):
	
	var params = value.split(",")
	
	# for extern signal call example affichage la main
	if params[0] == "emit":
		#set variable command
		var variable_name = params[1]
		if variable_name == "give_tool":
			var variable_value = params[2]	
			state[variable_name].emit(variable_value)
			print("player received", variable_value)
	
		if variable_name == "give_letter":		
				state[variable_name].emit()
		return
		
			

func _on_ez_dialogue_end_of_dialogue_reached():
	dialogue_box.is_dialogue_done = true		
	_global_datas._close_dialogue.emit()
	

func _on_close_dialogue_only():
	dialogue_box.is_dialogue_done = true		
	_global_datas._close_dialogue.emit()

