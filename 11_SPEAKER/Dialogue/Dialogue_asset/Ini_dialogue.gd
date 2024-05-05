extends  Node


@onready var dialogue_box = $"../00_NPC_CREATOR/Npc_convas/Dialogue_box"
signal up_dialogue_index 

@onready var state = {
	
	"give_letter" : _global_datas._give_letter,	
	"take_note":_global_datas._take_note,
	"up_dialogue_index" : up_dialogue_index,
	"cam_focus" : _global_datas._update_cam_focus
}

func _ready():
	_global_datas._start_dialogue_box.connect(_open_dialogue)
	
func _open_dialogue():
	
	dialogue_box.is_dialogue_done = false
	var dialogue = _global_datas.Npc_Dialogue.Dialogue_data
	var index = _global_datas.Npc_Dialogue.Dialogue_start_index
	var _dialogue_start = _global_datas.Npc_Dialogue.Dialogue_starts[index]
	($EzDialogue as EzDialogue).start_dialogue(dialogue, state, _dialogue_start)
	
				
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
		if variable_name == "cam_focus":
			var variable_value = params[2]
			var camera_state = variable_value.to_int()	
			state[variable_name].emit(camera_state)

		if variable_name == "give_letter":
				var note_name = params[2]
				state[variable_name].emit(note_name)
				_global_datas._hide_dialogue_box.emit()
		if variable_name == "take_note":
				var _note_name = params[2]
				state[variable_name].emit(_note_name)
				_global_datas._hide_dialogue_box.emit()
		if variable_name == "up_dialogue_index":
			up_dialogue_index.emit()	
		

func _on_ez_dialogue_end_of_dialogue_reached():
	dialogue_box.is_dialogue_done = true	
	_global_datas._close_dialogue.emit()
	


func _on_up_dialogue_index():
	_global_datas.Npc_Dialogue.Dialogue_start_index =+ 1
