extends Node

@onready var load_scene = $"../../LoadScene"
var scene_oddity_element : Array


func _ready():
	_global_datas.instance_scene_oddity.connect(instancer_multiple)
	
	
func instancer_register(_oddity : Oddity_scene_data,position : Vector3):
	 
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = position
	oddity.follow.emit()

	scene_oddity_element.append(oddity)
	
func instancer_multiple(_oddity : Oddity_scene_data, amount : int, position : Vector3):
	
	for i in range(amount):
		instancer_register(_oddity,position)
		

func _delete_scene_oddity():
	for o in scene_oddity_element:
		if o != null:
			o.queue_free()
	scene_oddity_element.clear()
