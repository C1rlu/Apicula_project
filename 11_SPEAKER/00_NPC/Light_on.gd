extends Node
@onready var npc_light = $"../NPC_light"


func _ready():
	npc_light.visible = false
	_global_datas._show_dialogue_box.connect(_light_on)
	

			
				
func _light_on():
	npc_light.visible = true
