extends Node


@export var active_oddity : bool = false
@export var Oddity_inventory_base: Oddity_inventory


@export var Follower_scene_data : Oddity_scene_data
@export var Scanner_scene_data : Oddity_scene_data


@onready var load_scene = $"../../LoadScene"

var scene_oddity_element : Array

func _ready():
	
	if !active_oddity:
		return
	_global_datas._end_ini_subscene.connect(instance_oddity)
	_global_datas.instance_scene_oddity.connect(instancer_multiple)
	_global_datas._backFrom_subscene.connect(_delete_scene_oddity)
	
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
	

	scene_oddity_element.append(oddity)
	
func instancer_register(_oddity : Oddity_scene_data):
	 
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow.emit()
	oddity.register.emit()
	
	scene_oddity_element.append(oddity)
	
func instancer_multiple(_oddity : Oddity_scene_data, amount : int):
	
	for i in range(amount):
		instancer_register(_oddity)
		

func _delete_scene_oddity():
	for o in scene_oddity_element:
		if o != null:
			o.queue_free()
	scene_oddity_element.clear()
