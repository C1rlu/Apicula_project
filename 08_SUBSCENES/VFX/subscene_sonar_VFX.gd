extends Node3D



func _set_color(color : Color):

	var mesh_material = $Msh.get_surface_override_material(0)
	var mesh_round_material = $Msh_round.get_surface_override_material(0)	
	
	mesh_material.set_shader_parameter("Color",color)
	mesh_round_material.set_shader_parameter("Color",color)
