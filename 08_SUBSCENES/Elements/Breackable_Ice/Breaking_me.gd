extends Node

@export var base_fracture_mesh : MeshInstance3D
@export var fracture_mesh : Array[MeshInstance3D]

@export var fracture_mesh_rg : Array[RigidBody3D]

@onready var root = $"../.."
@onready var collision_shape_3d = $"../CollisionShape3D"

const EXPLOSED_ROCK_VFX = preload("res://08_SUBSCENES/Elements/Breackable_Ice/Block_test/explosed_rock_vfx.tscn")
var hit_index : int 

var debris_inside : Array[Node]
signal breaking_done

func _hit():
	
	hit_index += 1
	
	if hit_index >= 3:
		explose_rock()

			
func explose_rock():
	
	#instance_vfx()
	base_fracture_mesh.visible = false
	collision_shape_3d.set_deferred("disabled", true)
	if fracture_mesh:
		for f in fracture_mesh:
			f.create_fracture()
	breaking_done.emit()		
	#root.queue_free()
	
	
func instance_vfx():
	
	var vfx = EXPLOSED_ROCK_VFX.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.global_position = root.global_position
