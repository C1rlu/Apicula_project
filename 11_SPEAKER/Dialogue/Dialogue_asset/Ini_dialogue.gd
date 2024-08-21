extends  Node


@onready var dialogue_box = $"../00_NPC_CREATOR/Npc_convas/Dialogue_box"

@onready var state = {
	
	"give_letter" : _global_datas._give_letter,	
	"npc_ls_node" : null, # for next selected NPC dialogie node
	"cam_focus" : _global_datas._update_cam_focus,
	"up_page_info_state" : null,
	"active_queste_done" : null,
	"wait_otis" : null,
}

func _ready():
	_global_datas._start_dialogue_box.connect(_open_dialogue)

		
func _open_dialogue():
	
	dialogue_box.is_dialogue_done = false
	var dialogue = _global_datas.Npc_Dialogue.Dialogue_data
	var _dialogue_start = _global_datas.Npc_Dialogue.Dialogue_active_node
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
		if variable_name == "npc_ls_node":
			var node_name = params[2]
			update_npc_active_node(node_name)
		
			
		if variable_name == "cam_focus":
			var variable_value = params[2]
			var camera_state = variable_value.to_int()	
			state[variable_name].emit(camera_state)
				
		if variable_name == "give_letter":
				var index = params[2]
				var _index_int : int = int(index)
				state[variable_name].emit(_index_int)	
				

		if variable_name == "add_OBJ":
			var obj_name = params[2]
			print(obj_name, " object gave by NPC")
		
		if variable_name == "can_dive":
			_global_datas.active_diving.emit()		
		#below for INTRIGUE intrigue state to page info state

		if variable_name == "intrigue_index": #here for intrigue so photo on board
			#var page_state_index = params[2] # 0 = intrigue off # 1 = introgue start ? 2 = intrigue found 
			#_global_datas.Npc_Dialogue.photo_data.board_information_state = page_state_index		
			_global_datas.ui_noted_taked.emit()	
		
		if variable_name == "up_page_info_state": # here for page what to show index
			#var info_state = params[2]
			#_global_datas.Npc_Dialogue.photo_data.page_information_state = info_state
			_global_datas.ui_noted_taked.emit()
			
func update_npc_active_node(ls_node_name : String):

	_global_datas.Npc_Dialogue.Dialogue_active_node = ls_node_name 
	print("next dialogue of this NPC will be ", _global_datas.Npc_Dialogue.Dialogue_active_node)	
				
func _on_ez_dialogue_end_of_dialogue_reached():
	dialogue_box.is_dialogue_done = true	
	_global_datas._close_dialogue.emit()
	_global_datas._update_cam_focus.emit(0)



