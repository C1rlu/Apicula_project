extends Node

@export var Bird_NPC_data : Npc_datas
@export var On_Move : Node
@export var On_Over : Node
var element : element_data
func _ready():
	On_Move.On_Move.connect(call_bird)
	On_Over.On_Over.connect(_show_quest_info)
	
func _show_quest_info(condition):

	_global_datas._show_object_legend.emit(condition,element.element_name)	
func call_bird(condition):
	#print("SENDING LETTERS")
	#print("GO TO ENCHERE")
	#_global_datas._check_object.emit()
	#_global_datas.open_inventory.emit(false)
	#_global_datas.Player_In_Inventory = false
	_global_datas.Npc_Dialogue = Bird_NPC_data
	_global_datas._check_dialogue_photo.emit()
	#_global_datas._open_dialogue.emit()
	
func _send_bird():
	_global_datas.sending_bird.emit()
