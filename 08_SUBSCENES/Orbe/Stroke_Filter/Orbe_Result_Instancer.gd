extends Node

@onready var load_scene = $"../../LoadScene"


func _ready():
	
	_global_datas.instance_orbe_result.connect(instance_orbe)
	
	
func instance_orbe(orbe : orbe_data,instance_position : Vector3):
	

	var instance = orbe.Orbe_Result_prefabs.instantiate()
	instance.position = instance_position
	
	load_scene.add_child(instance)
	

	
	
