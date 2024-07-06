extends Node
@onready var root = $".."

@onready var birds = $"../../NPC_AREA2/Birds"


func get_npc():

	return root.Npc_data

func disable_this():
	birds.visible = false

func remove():
	root.queue_free()	
