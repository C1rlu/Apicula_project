extends Node

@onready var dialogue = $"00_NPC_CREATOR/Npc_convas"
@onready var name_text = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_text"

@onready var dialogue_box = $"00_NPC_CREATOR/Npc_convas/Dialogue_box"

@onready var dialogue_name = $"00_NPC_CREATOR/Npc_convas/Dialogue_box/Dialogue_name"

func _ready():
	_global_datas._open_dialogue.connect(_open_dialogue)
	_global_datas._close_dialogue.connect(close_dialogue)
	_global_datas._show_dialogue_box.connect(_show_dialogue_box)
	_global_datas._hide_dialogue_box.connect(_hide_dialogue_box)

func _hide_dialogue_box():
	dialogue_box.visible = false	
	
func _show_dialogue_box():
	dialogue_box.visible = true

func _open_dialogue():
		
	if _global_datas.Npc_Dialogue == null:
		return
	_global_datas.Player_InDialogue = true
	_global_datas.Player_InMenu = true
	dialogue.visible = true
	name_text.text = _global_datas.Npc_Dialogue.name
	#_global_datas._call_back.connect(close_dialogue)
	$Random_FaceChanger/Timer.start()				
	dialogue_name.text = _global_datas.Npc_Dialogue.name

	
func close_dialogue():
	_global_datas.in_dialogue_zone.emit()
	dialogue.visible =  false
	_global_datas.Player_InDialogue = false
	_global_datas.Player_InMenu = false
	
	#_global_datas._call_back.disconnect(close_dialogue)
	$Random_FaceChanger/Timer.stop()


func _on_leave_button_pressed():
	_global_datas._close_dialogue.emit()


