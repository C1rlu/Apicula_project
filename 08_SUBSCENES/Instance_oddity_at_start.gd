extends Node

@onready var load_scene = $"../LoadScene"


@export var All_Oddity : Array[Oddity_data]

func _ready():
	_global_datas._end_ini_subscene.connect(instance_oddity)



#TO INSTANCE IN SCENE
func instance_oddity():
	
	for o in _global_datas.oddity_in_inventory:
		instancer(o)
	
func instancer(_oddity : Oddity_data):
	
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow()

