extends Node

@onready var breakable_stone = $"../.."

var hit_index : int 

func _hit():
	
	hit_index += 1
	
	if hit_index >= 3:
		get_rigidbody()
		


func get_rigidbody():
	
	var all_child = breakable_stone.get_children()
	for child in all_child:
		if child is RigidBody3D:
			child.freeze = false		
			child.reparent(_global_datas.LoadScene)
			var random_position = Vector3(randf_range(-1,1),randf_range(-1,1),randf_range(-1,1))
		
			child.apply_central_force(random_position * 25)
	breakable_stone.queue_free()
	
