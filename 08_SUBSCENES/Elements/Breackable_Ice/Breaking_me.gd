extends Node


@export var fracture_mesh : Array[MeshInstance3D]
@onready var root = $"../.."

const EXPLOSED_ROCK_VFX = preload("res://08_SUBSCENES/Elements/Breackable_Ice/Block_test/explosed_rock_vfx.tscn")
var hit_index : int 


func _hit():
	
	hit_index += 1
	
	if hit_index >= 1:
		explose_rock()
		


func explose_rock():
	
	instance_vfx()
	
	var all_child = root.get_children()
	for child in all_child:
		if child is RigidBody3D:
			child.freeze = false		
			child.reparent(_global_datas.LoadScene)
			var random_position = Vector3(randf_range(-1,1),randf_range(-1,1),randf_range(-1,1))
		
			child.apply_central_force(random_position * 10)
			
	if fracture_mesh:
		for f in fracture_mesh:
			f.create_fracture()
			
	root.queue_free()
	
	
func instance_vfx():
	
	var vfx = EXPLOSED_ROCK_VFX.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.global_position = root.global_position
