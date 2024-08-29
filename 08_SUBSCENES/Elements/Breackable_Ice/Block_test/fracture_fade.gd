extends MeshInstance3D


var material : Material 
func _ready():

	var current_material = self.get_surface_override_material(0)
	if current_material != null:
		var new_material = current_material.duplicate()
		self.set_surface_override_material(0,new_material)
	
	material = self.get_surface_override_material(0)
	
func create_fracture():
	visible = true

	var random_x = randf_range(-60,60)
	var random_y = randf_range(-60,60)
	var random_z = randf_range(-180,180)
	var rotation_target = Vector3(random_x,random_y,random_z)
	var _rotate
	_rotate = create_tween()
	_rotate.tween_property(self,"rotation_degrees",rotation_target,5).set_ease(Tween.EASE_OUT)
	
	#var r_x = randf_range(-1,1)
	#var r_y = randf_range(-1,1)
	#var r_z = randf_range(-1,1)
	var dir = (global_position - _global_datas.subbscene_playerPosition).normalized()
	var position_target = dir * 1 # Vector3(r_x,r_y,r_z) + 
	
	var move
	move = create_tween()
	move.tween_property(self,"position",position_target,5)
	
	#var s
	#s = create_tween()
	#s.tween_property(self,"scale",Vector3(0.8,0.8,0.8),2)

	
	var t
	t = create_tween()
	t.tween_method(_value,1.0,0.0,4)	
	t.connect("finished", done)
	

		
func done():
	queue_free()
	
func _value( value : float):

	material.set_shader_parameter("Opacity",value)	

