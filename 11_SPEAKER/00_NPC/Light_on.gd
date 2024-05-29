extends Node
@onready var npc_light = $"../NPC_light"


func _ready():
	npc_light.visible = false
	_global_datas._show_dialogue_box.connect(_light_on)
	
	
	if _global_datas.Npc_Dialogue != null:
		var photo_Data = _global_datas.Npc_Dialogue.photo_data
		if check_photo_exist(photo_Data):
			_light_on()	
	

func check_photo_exist(photo_Data):
	
	for photo in _global_datas.photo_archives:
		if photo == photo_Data:
			return true 	
			
			
				
func _light_on():
	npc_light.visible = true
