extends Node


@export var _mesh : MeshInstance3D


func _ready():
	pass
	#_set_variety()
	
	
func _set_variety():
	
	var all_shader = _mesh.get_surface_override_material_count()


	var all_surf_material : Array[Material] = []
	for i in range(all_shader):
		var n_material = _mesh.get_surface_override_material(i) 
		all_surf_material.append(n_material)			
	
	
	for m in all_surf_material:
		var current_color = m.get_shader_parameter("Color")
		var random_new_color = current_color + Color(randf_range(-0.01, 0.01), randf_range(-0.01, 0.01), randf_range(-0.01, 0.01), 1.0)
		m.set_shader_parameter("Color",random_new_color)
