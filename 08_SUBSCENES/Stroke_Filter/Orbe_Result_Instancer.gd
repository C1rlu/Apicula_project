extends Node

@onready var load_scene = $"../../LoadScene"


func _ready():
	pass
	
func instance_orbe(orbe,instance_position):
	

	var instance = orbe.Orbe_Result_prefabs.instantiate()
	instance.position = instance_position
	
	load_scene.add_child(instance)
	

	
	
