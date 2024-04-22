extends Node

@onready var meduse_species_prefab = $".."

func remover():
	
	meduse_species_prefab.queue_free()	
	
