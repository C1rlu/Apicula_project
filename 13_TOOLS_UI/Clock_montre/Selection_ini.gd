extends Node

@export var root : Node3D
@export var Movable : Node3D

var list_of_selection_data : Array[selection_data]

const MOVING_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/moving_object_dither.tres")
const MOVING_OVERLAP_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/overlaping_object_dither.tres")

func _ready():
	Movable.select_render_state.connect(ini_selection)
	archive_materials()
	
	#for r in list_of_selection_data:
		#print(r.render_material)
	
func ini_selection(index_state : int):

	if index_state == 0:
		restore_original_materials()

	if index_state == 1:
		set_all_material(MOVING_OBJECT)
	if index_state == 2:
		set_all_material(MOVING_OVERLAP_OBJECT)
		
		
func set_all_material(material : Material):
	
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		if render_mesh.mesh:
			for i in range(render_mesh.mesh.get_surface_count()):
				render_mesh.set_surface_override_material(i, material)

func restore_original_materials():
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		var materials = selection.render_material
		
		if render_mesh.mesh and materials.size() > 0:
			for i in range(render_mesh.mesh.get_surface_count()):
				if i < materials.size():
					render_mesh.set_surface_override_material(i, materials[i])


func archive_materials():
	var all_render = get_all_render(root)	

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
		list_of_selection_data.append(new_selection_data)
		
		
		
func get_all_render(scene)-> Array:
	
	var meshs: Array = []
	for node in scene.get_children():
		if node is MeshInstance3D:
			meshs.append(node)
		meshs += get_all_render(node)
	

	return meshs	
	
