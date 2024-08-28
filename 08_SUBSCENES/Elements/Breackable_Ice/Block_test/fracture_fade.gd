extends RigidBody3D

@export var mesh : MeshInstance3D
@onready var material : Material = mesh.get_surface_override_material(0)
func _fade_me():
	
		var t
		t = create_tween()
		t.tween_method(_value,1.0,0.0,1.0)	
		t.connect("finished", done)
		
func done():
	queue_free()
	
func _value( value : float):

	material.set_shader_parameter("Opacity",value)	

