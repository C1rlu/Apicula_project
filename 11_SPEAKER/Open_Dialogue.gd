extends Node

@onready var dialogue = $"00_NPC_CREATOR/Npc_convas"
@onready var name_text = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_text"

@onready var dialogue_box = $"00_NPC_CREATOR/Npc_convas/Dialogue_box"

@onready var dialogue_name = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_name"
@onready var dialogue_name_show = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_name/ColorRect/Dialogue_name_show"

@onready var npc_convas = $"00_NPC_CREATOR/Npc_convas"

func _ready():
	_global_datas._open_dialogue.connect(_open_dialogue)
	_global_datas._close_dialogue.connect(_close_dialogue)
	_global_datas._show_dialogue_box.connect(_show_dialogue_box)
	_global_datas._hide_dialogue_box.connect(_hide_dialogue_box)
	npc_convas.visible = false
	
func _hide_dialogue_box():
	dialogue_box.visible = false	
	
func _show_dialogue_box():
	dialogue_box.visible = true



func _open_dialogue():
		
	if _global_datas.Npc_Dialogue == null:
		return
	_global_datas.Player_InDialogue = true

	_global_datas.go_darker_color.emit()
	
	dialogue.visible = true
	name_text.text = _global_datas.Npc_Dialogue.name

	$Random_FaceChanger/Timer.start()				
	dialogue_name.text = _global_datas.Npc_Dialogue.name
	dialogue_name_show.text = _global_datas.Npc_Dialogue.name

				
func _close_dialogue():
	
	#_global_datas.in_dialogue_zone.emit()
		
	dialogue.visible =  false
	_global_datas.Player_InDialogue = false
	#_global_datas.go_normal_color.emit()
	
	if _global_datas.Npc_Dialogue.name == "MrBird":
		_global_datas.Npc_Dialogue = null
		#_global_datas.out_dialogue_zone.emit()
	#if !_global_datas.Waiting_bird:
		#_global_datas.go_normal_color.emit()
	#else:
		#_global_datas.out_dialogue_zone.emit()	
	$Random_FaceChanger/Timer.stop()


func _on_leave_button_pressed():
	_global_datas._close_dialogue.emit()
	

