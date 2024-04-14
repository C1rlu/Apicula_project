extends Node

@onready var load_scene = $"../LoadScene"


@export var follower_data : Oddity_data
@export var scannner_data : Oddity_data

func _ready():
	_global_datas._end_ini_subscene.connect(instance_oddity)



#TO INSTANCE IN SCENE
func instance_oddity():
	
	var number_of_follower = _global_datas.oddity_in_inventory.Number_of_followers
	var number_of_scanner = _global_datas.oddity_in_inventory.Number_of_scanner
	
	for i in number_of_follower:
		instancer(follower_data)	

	for i in number_of_scanner:
		instancer(scannner_data)	
	
func instancer(_oddity : Oddity_data):
	
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow_from_inventory()

