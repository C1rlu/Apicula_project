extends Object
class_name GameUtility

				
func get_closest_point(_target : Vector3, points_list : Array) -> Vector3:
	var closest_point : Vector3 
	var closest_distance = INF 
	for p in points_list:
		var distance = p.position.distance_squared_to(_target) 
		
		if distance < closest_distance:
			closest_distance = distance
			closest_point = p.position 
	
	return closest_point  # Return the closest point found

# WARNING  it's here with a disctionnary
func get_closest_element(reference, array):
	var closest_element = null
	var closest_distance = INF

	for element in array:
		var distance = reference.distance_to(element._position)
		if distance < closest_distance:
			closest_distance = distance
			closest_element = element

	return closest_element	
		
# this is working only with selection_data ressource -> usefull  to store mesh override materials ( event the mesh index materials ) 
func archive_materials(_root)-> Array:
	
	var all_render = get_all_render(_root)	
	var selection_data_list : Array = []
	
	for r in all_render:
		var new_selection_data = selection_data.new()
		new_selection_data.render_mesh = r
		var materials : Array[Material] = []
		for i in range(r.mesh.get_surface_count()):
			var material = r.get_surface_override_material(i)
			if material:
				materials.append(material)
			else:
				materials.append(r.mesh.surface_get_material(i))

		new_selection_data.render_material = materials
		selection_data_list.append(new_selection_data)
	
	return selection_data_list

#to get all MeshInstance3D in a scene tree			
func get_all_render(scene)-> Array: 
	
	var meshs: Array = []
	for node in scene.get_children():
		if node is MeshInstance3D:
			meshs.append(node)
		meshs += get_all_render(node)
	

	return meshs	



func get_raycast_target(targetPos : Vector2, Camera : Camera3D) -> Dictionary: 
	
	var rayLengh = 250.0
	var from = Camera.project_ray_origin(targetPos)
	var to = from + Camera.project_ray_normal(targetPos) * rayLengh
	var space = Camera.get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.collision_mask = 1
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = false
	
	var result = space.intersect_ray(rayQuery)

	return result
	
	
func create_timer(time_in_seconds: float, time_out : Callable,parent : Node) -> Timer:
	var timer = Timer.new()
	timer.wait_time = time_in_seconds
	timer.one_shot = true  
	timer.connect("timeout", time_out)
	timer.connect("timeout",func():timer.queue_free()) #TO REMOVE TIMER AT THE END OF USED
	parent.add_child(timer)
	return timer


	
	
