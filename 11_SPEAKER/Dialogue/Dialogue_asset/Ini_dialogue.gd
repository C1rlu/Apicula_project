extends  Node


@onready var dialogue_box = $"../00_NPC_CREATOR/Npc_convas/Dialogue_box"
signal up_dialogue_index 

@onready var state = {
	
	"LS" : 0, # lANGUAGE STATE 0 > ENGLISH 1 > FRENCH
	"give_letter" : _global_datas._give_letter,	
	"up_dialogue_index" : up_dialogue_index,
	"cam_focus" : _global_datas._update_cam_focus,
	"up_page_info_state" : null,
	"give_board_item" : _global_datas.show_element_on_board,
	"active_queste_done" : null,
	"wait_otis" : null
}

func _ready():
	_global_datas._start_dialogue_box.connect(_open_dialogue)
	_global_datas._change_language_state.connect(change_language_state)
	
func change_language_state(state_value : int):	
	state["LS"] = state_value	

		
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
		if variable_name == "up_page_info_state":
			var variable_value = params[2]
			var info_state = variable_value.to_int()	
			up_info_state(info_state)
			
		if variable_name == "cam_focus":
			var variable_value = params[2]
			var camera_state = variable_value.to_int()	
			state[variable_name].emit(camera_state)
			
		if variable_name == "active_queste_done":
				_global_datas.active_queste.done = true
	
				
		if variable_name == "give_letter":
				var index = params[2]
				var _index_int : int = int(index)
				state[variable_name].emit(_index_int)	
				
		if variable_name == "up_dialogue_index":
	
			up_dialogue_index.emit()	
		
		if variable_name == "give_board_item":
			var _index = params[2]
			var _index_int : int = int(_index)
			state[variable_name].emit(_index_int)
	
		
		if variable_name == "wait_otis":
			_global_datas.Waiting_bird = true
			_global_datas.wait_for_otis.emit()
		
		if variable_name == "open_inventory":
			var bool_str = params[2]
			if bool_str == "true":
				_global_datas.open_inventory.emit(true)
			if bool_str == "false":
				_global_datas.open_inventory.emit(false)

func _on_ez_dialogue_end_of_dialogue_reached():
	dialogue_box.is_dialogue_done = true	
	_global_datas._close_dialogue.emit()
	
func up_info_state(index : int):
	var actual = _global_datas.Npc_Dialogue.photo_data.page_information_state
	if index <= actual:
		return
		
	_global_datas.Npc_Dialogue.photo_data.page_information_state = index	
	print("up page info to   ", _global_datas.Npc_Dialogue.photo_data.page_information_state)	
	_global_datas.ui_noted_taked.emit()
func _on_up_dialogue_index():
	
	_global_datas.Npc_Dialogue.Dialogue_start_index =+ 1
	if _global_datas.Npc_Dialogue.photo_data.board_information_state == 3:
		_global_datas.ui_noted_taked.emit()
		return
	_global_datas.Npc_Dialogue.photo_data.board_information_state = 2		
	_global_datas.ui_noted_taked.emit()
