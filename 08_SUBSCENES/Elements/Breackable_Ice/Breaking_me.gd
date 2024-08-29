extends Node


@export var fracture_mesh : Array[MeshInstance3D]
@onready var root = $"../.."
@export var _area : Area3D

const EXPLOSED_ROCK_VFX = preload("res://08_SUBSCENES/Elements/Breackable_Ice/Block_test/explosed_rock_vfx.tscn")
var hit_index : int 

var debris_inside : Array[Node]

func _ready():
	_global_datas._end_ini_subscene.connect(_get_debris_and_freeze)
	
func _get_debris_and_freeze():
	
	if _area:
		var areas = _area.get_overlapping_areas()

		for a in areas:
			var debris = a.get_node_or_null("Debris")
			if debris:
				debris.freeze_body.emit(true)
				debris_inside.append(debris)

func _hit():
	
	hit_index += 1
	
	if hit_index >= 3:
		explose_rock()
		
	for debris in debris_inside:
		if debris != null: 
			debris.freeze_body.emit(false)

func explose_rock():
	
	instance_vfx()
	
	
	if fracture_mesh:
		for f in fracture_mesh:
			f.create_fracture()
			
	root.queue_free()
	
	
func instance_vfx():
	
	var vfx = EXPLOSED_ROCK_VFX.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.global_position = root.global_position
