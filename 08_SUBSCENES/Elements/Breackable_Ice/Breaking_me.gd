extends Node

@onready var root = $"../.."

const EXPLOSED_ROCK_VFX = preload("res://08_SUBSCENES/Elements/Breackable_Ice/Block_test/explosed_rock_vfx.tscn")
var hit_index : int 

@export var fractures : Array[RigidBody3D]

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
			
			
	show_fractures()
	root.queue_free()
	

func instance_vfx():
	
	var vfx = EXPLOSED_ROCK_VFX.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.global_position = root.global_position

func show_fractures():
	var random_position = Vector3(randf_range(-1,1),randf_range(-1,1),randf_range(-1,1))
	if fractures:
		for f in fractures:
			f.visible = true
			f.freeze = false
			var random_rotation = Vector3(randf_range(-90,90),randf_range(-1,1),randf_range(-180,180))
			f.apply_central_force(random_position * 50)		
			f.apply_torque(random_rotation * 0.1)		
			f._fade_me()
