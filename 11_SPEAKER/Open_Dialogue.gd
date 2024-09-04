extends Node

@onready var dialogue = $"00_NPC_CREATOR/Npc_convas"

@onready var dialogue_box = $"00_NPC_CREATOR/Npc_convas/Dialogue_box"

@onready var dialogue_name = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_name"
@onready var dialogue_name_show = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_name/ColorRect/Dialogue_name_show"

@onready var npc_convas = $"00_NPC_CREATOR/Npc_convas"



var Localisation_state_index : int = 0
var in_zone : bool = false

func _ready():
	_global_datas._check_dialogue_photo.connect(_check_if_exist)
	_global_datas._open_dialogue.connect(_open_dialogue)
	_global_datas._close_dialogue.connect(_close_dialogue)
	_global_datas._show_dialogue_box.connect(_show_dialogue_box)
	_global_datas._hide_dialogue_box.connect(_hide_dialogue_box)
	_global_datas._change_language_state.connect(change_ls)
	
	npc_convas.visible = false


func change_ls(ls):
	Localisation_state_index = ls
	update_name_ls()	
func _hide_dialogue_box():
	dialogue_box.visible = false	
	
func _show_dialogue_box():
	dialogue_box.visible = true

func _check_if_exist():
		
	if _check_photoExist(_global_datas.Npc_Dialogue.photo_data):
		_global_datas._open_dialogue.emit()
		_global_datas._photo_checking = false
	else:
		var photo_data = _global_datas.Npc_Dialogue.photo_data
		_global_datas._give_photo.emit(photo_data)
		_global_datas.photo_archives.append(photo_data)
		_global_datas._photo_checking = true
func _check_photoExist(photoData : PhotoData) -> bool:
	
	for photo in _global_datas.photo_archives:
		if photo == photoData:
			return true	
	return false	
					
func _open_dialogue():

	_global_datas.Player_InDialogue = true
	_global_datas.go_darker_color.emit()
	_global_datas.Open_ui_dark_backdrop.emit(true)
	dialogue.visible = true
	$Random_FaceChanger/Timer.start()				
	update_name_ls()
	_global_datas._add_back_call.emit(back_call)





func update_name_ls():
	
	if !_global_datas.Player_InDialogue:
		return
	if Localisation_state_index > _global_datas.Npc_Dialogue.name.size()-1:
		dialogue_name_show.text  = "NO LOCALISATION NAME HERE"
		dialogue_name_show.text  = "NO LOCALISATION NAME HERE"
	else:
		dialogue_name.text = _global_datas.Npc_Dialogue.name[Localisation_state_index]
		dialogue_name_show.text = _global_datas.Npc_Dialogue.name[Localisation_state_index]	
func _close_dialogue():
	

	_global_datas.Open_ui_dark_backdrop.emit(false)
	dialogue.visible =  false
	_global_datas.Player_InDialogue = false
	_global_datas.go_normal_color.emit()
	$Random_FaceChanger/Timer.stop()

	
func back_call():
	_global_datas._close_dialogue.emit()
	
