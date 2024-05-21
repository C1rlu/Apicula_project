extends Node

@onready var load_scene = $"../../LoadScene"


func _ready():
	_global_datas.instance_scene_oddity.connect(instancer_multiple)
	
	
func instancer_register(_oddity : PackedScene,position : Vector3):
	 
	var oddity = _oddity.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = position
	oddity.push.emit()


func instancer_multiple(_oddity : PackedScene, amount : int, position : Vector3):
	
	for i in range(amount):
		instancer_register(_oddity,position)
		
