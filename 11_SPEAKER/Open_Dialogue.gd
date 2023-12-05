extends Node

@onready var dialogue = $"00_NPC_CREATOR/Npc_convas"


func _ready():
	_global_datas._open_dialogue.connect(_open_dialogue)
	_global_datas._close_dialogue.connect(close_dialogue)
	
func _open_dialogue():
		
	if _global_datas.Npc_Dialogue == null:
		return
	_global_datas.Player_InDialogue = true
	_global_datas.Player_InMenu = true
	dialogue.visible = true
	
	_global_datas._call_back.connect(close_dialogue)
	$Random_FaceChanger/Timer.start()				
	
func close_dialogue():
	_global_datas.in_dialogue_zone.emit()
	dialogue.visible =  false
	_global_datas.Player_InDialogue = false
	_global_datas.Player_InMenu = false
	
	_global_datas._call_back.disconnect(close_dialogue)
	$Random_FaceChanger/Timer.stop()
