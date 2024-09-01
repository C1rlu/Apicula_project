extends Node


@export var fracture_mesh : Array[MeshInstance3D]
@export var Teleporter : Node
@onready var root = $"../.."
@onready var render = $"../.."

var hit_index : int 

@onready var timer = $Timer
const fracture_dark_material : Material = preload("res://08_SUBSCENES/Oddity/Teleporter/Teleporter_prefab_mat.tres")
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
	
	if fracture_mesh:
		for f in fracture_mesh:
			f.create_fracture()
	_fade()
			
func _fade():
	var fade
	fade = create_tween()
	
	fade.tween_method(value,1.0,0.0,1)
	
func value(_value : float):
	fracture_dark_material.set_shader_parameter("Opacity",_value)	
