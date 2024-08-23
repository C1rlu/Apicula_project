extends Object
class_name GameUtility


func find_node_with_script(root: Node, script_name : String) -> Node:
	
	var script = root.get_script().get_path()
	if script == script_name:
		return root 
	return null	
	
# this is working only with selection_data ressource usefull  to store mesh override materials ( event the mesh index materials ) 
func archive_materials(_root)-> Array:
	
	var all_render = get_all_render(_root)	
	var selection_data_list : Array = []
	
	for r in all_render:
		var new_selection_data = selection_data.new()
		new_selection_data.render_mesh = r
		# Create an array to hold the materials for the current mesh instance
		var materials : Array[Material] = []
			
		# Iterate through the surfaces and store the override materials
		for i in range(r.mesh.get_surface_count()):
			var material = r.get_surface_override_material(i)
			if material:
				materials.append(material)
			else:
				# If there's no override, you can opt to store the default material
				materials.append(r.mesh.surface_get_material(i))

		new_selection_data.render_material = materials
		
		
		# Add the new_selection_data to your list_of_selection_data
		selection_data_list.append(new_selection_data)
	
	return selection_data_list	

		
		
		
func get_all_render(scene)-> Array:
	
	var meshs: Array = []
	for node in scene.get_children():
		if node is MeshInstance3D:
			meshs.append(node)
		meshs += get_all_render(node)
	

	return meshs	
	
