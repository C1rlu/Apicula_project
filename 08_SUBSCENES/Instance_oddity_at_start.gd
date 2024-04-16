extends Node

@onready var load_scene = $"../../LoadScene"
@export var All_Oddity_scene : Array[Oddity_scene_data]
@export var Oddity_inventory : Array[Oddity_data]
func _ready():
	_global_datas._end_ini_subscene.connect(instance_oddity)
	_global_datas.oddity_list = Oddity_inventory
	
#TO INSTANCE IN SCENE
func instance_oddity():

	
	for o in _global_datas.oddity_list:
		print(o, " result for oddity current list")
	
		for oddity_scene in All_Oddity_scene:	
			var type = oddity_scene.Oddity_type 
			if type == o.Oddity_type:
				instancer(oddity_scene)	 		
		
	
func instancer(_oddity : Oddity_scene_data):
	
	var oddity = _oddity.Oddity_prefabs.instantiate()
	load_scene.add_child(oddity)
	
	oddity.position = _global_datas.subbscene_playerPosition
	oddity.follow.emit()

