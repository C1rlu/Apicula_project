extends Node

@onready var loader_node = $"../00_NPC_CREATOR/Models/Loader"

func _ready():
	_global_datas._open_dialogue.connect(update_npc)
	#_global_datas._update_npc_ini.connect(update_NPC)

func update_NPC():
	pass
	#$"../Speacker_ui/BACKDROP/BACKDROP2/TextureRect".set_texture(ImageTexture.create_from_image(npc_data.image))
	
func update_npc():

	for child in loader_node.get_children():
		loader_node.remove_child(child)
	
	
	var instance = _global_datas.Npc_Dialogue.prefabs.instantiate()
	loader_node.add_child(instance)
