extends MeshInstance3D

@export var root: Node3D


var _base_position : Vector3
var _base_rotation : Vector3
#var material : Material 
#
#func _ready():
#
	#var current_material = self.get_surface_override_material(0)
	#if current_material != null:
		#var new_material = current_material.duplicate()
		#self.set_surface_override_material(0,new_material)
	#
	#material = self.get_surface_override_material(0)
	#

func _ready():
	
	_base_position = position
	_base_rotation = rotation_degrees	
		
		
func show_fracture():
	visible = true
	
	var random_x = randf_range(-6,6)
	#var random_y = randf_range(-6,6)
	#var random_z = randf_range(-6,6)
	var rotation_target = Vector3(random_x,0.0,0.0)	
	
	rotation_degrees += rotation_target	
		
		
func create_fracture():
	visible = true

	var random_x = randf_range(-60,60)
	var random_y = randf_range(-60,60)
	var random_z = randf_range(-180,180)
	var rotation_target = Vector3(random_x,random_y,random_z)
	var _rotate
	_rotate = create_tween()
	_rotate.tween_property(self,"rotation_degrees",rotation_target,2).set_ease(Tween.EASE_OUT)
	

	var dir = (root.global_position - global_position).normalized()
	var position_target = -dir * 6

	var move
	move = create_tween()
	move.tween_property(self,"position",position_target,2).set_ease(Tween.EASE_OUT)
	move.connect("finished", done)
	#var s
	#s = create_tween()
	#s.tween_property(self,"scale",Vector3(0.8,0.8,0.8),2)

	
	#var t
	#t = create_tween()
	#t.tween_method(_value,1.0,0.0,4)	
	#t.connect("finished", done)
	#

		
func done():
	visible = false
	position = _base_position
	rotation_degrees = _base_rotation		
	
#func _value( value : float):
#
	#material.set_shader_parameter("Opacity",value)	
