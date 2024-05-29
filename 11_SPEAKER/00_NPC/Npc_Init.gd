extends Node

@export var Npc_all: Array[Npc_datas] = []
@onready var loader_node = $Models/Loader

func _ready():
	pass
	#create_texture()
	
	
func create_texture():
	
	for npc_data in Npc_all:
		delete_previous()
		var instance = npc_data.prefabs.instantiate()
		loader_node.add_child(instance)
		await RenderingServer.frame_post_draw
		var img = $Npc_convas/CAM_NPCS/SubViewport.get_texture().get_image()
		npc_data.image = img
	

	delete_previous()	
	_global_datas._update_npc_ini.emit()
		
func delete_previous():
	for child in loader_node.get_children():
		loader_node.remove_child(child)



