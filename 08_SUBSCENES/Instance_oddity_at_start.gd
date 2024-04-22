extends Node

@export var Oddity_inventory_base: Oddity_inventory


@export var Follower_scene_data : Oddity_scene_data
@export var Scanner_scene_data : Oddity_scene_data


@onready var load_scene = $"../../LoadScene"
func _ready():
	_global_datas._end_ini_subscene.connect(instance_oddity)

	_global_datas.instance_scene_oddity.connect(instancer_multiple)
	
#TO INSTANCE IN SCENE
func instance_oddity():

	var followers = Oddity_inventory_base.amount_of_follower
	
	if followers > 0:
		for i in range(followers):
			instancer(Follower_scene_data)
		
	var scanner = Oddity_inventory_base.amount_of_X_SCANNER
	
	if scanner == 1 :
		instancer(Scanner_scene_data)	
			
		
func instancer(_oddity : Oddity_scene_data):
	
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow.emit()

	
func instancer_register(_oddity : Oddity_scene_data):
	 
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow.emit()
	oddity.register.emit()
	
func instancer_multiple(_oddity : Oddity_scene_data, amount : int):
	
	for i in range(amount):
		instancer_register(_oddity)
		
