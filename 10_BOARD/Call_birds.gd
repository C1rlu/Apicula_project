extends Node

@export var Bird_NPC_data : Npc_datas
@export var On_Move : Node

func _ready():
	On_Move.On_Move.connect(call_bird)
	
	
	
func call_bird(condition):
	#print("SENDING LETTERS")
	_global_datas.open_inventory.emit(false)
	_global_datas.Npc_Dialogue = Bird_NPC_data
	_global_datas._check_dialogue_photo.emit()
	#_global_datas._open_dialogue.emit()
	
