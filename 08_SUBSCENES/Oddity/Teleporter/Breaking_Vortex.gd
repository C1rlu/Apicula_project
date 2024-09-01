extends Node


@export var fracture_mesh : Array[MeshInstance3D]
@export var Teleporter : Node
@onready var root = $"../.."
@onready var render = $"../.."


const EXPLOSED_ROCK_VFX = preload("res://08_SUBSCENES/Elements/Breackable_Ice/Block_test/explosed_rock_vfx.tscn")
var hit_index : int 

@onready var timer = $Timer



func _ready():
	timer.timeout.connect(reset_hits)

func reset_hits():
	
	hit_index = 0

func _hit():
	
	hit_index += 1
	timer.start()
	render.visible = false
	if fracture_mesh:
		for f in fracture_mesh:
			f.show_fracture()
		
	
	if hit_index >= 3:
		
		explose_rock()
		Teleporter._teleport()
		hit_index = 0
		timer.stop()
		
		
		
		
func explose_rock():
	
	instance_vfx()
	
	
	if fracture_mesh:
		for f in fracture_mesh:
			f.create_fracture()
			
	#root.queue_free()
	
	
func instance_vfx():
	
	var vfx = EXPLOSED_ROCK_VFX.instantiate()
	_global_datas.LoadScene.add_child(vfx)
	vfx.global_position = root.global_position
