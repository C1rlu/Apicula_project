extends Node

@onready var load_scene = $"../../LoadScene"


func _ready():
	
	_global_datas.instance_orbe_result.connect(instance_orbe)
	
	
	
func instance_orbe(orbe : orbe_data,instance_position : Vector3):
	
	
	#INSTANCE ORBE ONLY IF PEON NEED IS TRUE
	var oddity_need = orbe.Oddity_need_number
	var oddity_following = _global_datas._peon_oddity_following.size()
	
	if oddity_following >= oddity_need:
	
		var instance = orbe.Orbe_Result_prefabs.instantiate()
		instance.position = instance_position
		load_scene.add_child(instance)
		
		#KILL USED PEON
		kill_used_oddity(oddity_need)


func kill_used_oddity(number : int ):
	
	#for a in _global_datas._peon_oddity_following:
		#print(a)
	for i in range(number):
		var selected_oddity = _global_datas._peon_oddity_following[i]
		selected_oddity.kill_oddity()
	
