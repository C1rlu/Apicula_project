extends Node
@onready var root = $".."

@export var mesh : MeshInstance3D
@export var mesh_round : MeshInstance3D

var mesh_material : Material
var mesh_round_material : Material

func _ready():
	mesh_material = mesh.get_surface_override_material(0)
	mesh_round_material =mesh_round.get_surface_override_material(0)
	scale()	

func scale():

	var t
	
	t = create_tween()
	t.tween_method(value,0.25,3.0,0.6).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var f
	
	f = create_tween()
	f.tween_method(fade_value,1.0,0.0,0.6).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)

	
	
func done():
	root.queue_free()
func value(size : float):
	
	root.scale = Vector3(size,size,size)	
	
func fade_value(_value : float):
	mesh_material.set_shader_parameter("Opacity",_value)
	mesh_round_material.set_shader_parameter("Opacity",_value)
	print(_value)
