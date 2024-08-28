extends MeshInstance3D


var material : Material 
func _ready():

	material = self.get_surface_override_material(0)
	
	
func create_fracture():
	visible = true
	
	var random_x = randf_range(-60,60)
	var random_y = randf_range(-60,60)
	var random_z = randf_range(-360,360)
	var rotation_target = Vector3(random_x,random_y,random_z)
	var move
	move = create_tween()
	move.tween_property(self,"rotation_degrees",rotation_target,5)
	
	var t
	t = create_tween()
	t.tween_method(_value,1.0,0.0,5)	
	t.connect("finished", done)

		
func done():
	queue_free()
	
func _value( value : float):

	material.set_shader_parameter("Opacity",value)	

