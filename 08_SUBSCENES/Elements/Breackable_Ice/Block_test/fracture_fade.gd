extends MeshInstance3D


var material : Material 
func _ready():

	material = self.get_surface_override_material(0)
	
	
func create_fracture():
	visible = true
	print("push")
	
	var rotation_target = Vector3(90,90,90)
	var move
	move = create_tween()
	move.tween_property(self,"rotation_degrees",rotation_target,10)
func _fade_me():
	
		var t
		t = create_tween()
		t.tween_method(_value,1.0,0.0,1.0)	
		t.connect("finished", done)
		
func done():
	queue_free()
	
func _value( value : float):

	material.set_shader_parameter("Opacity",value)	

