extends Node

@export var View_broke : Node3D


func _ready():
	View_broke.create_broke_particule.connect(create_broken)
	
	
func create_broken(all_mesh : Array):
	#print(element.element_name, " redy to calculate points")
	
	
	print(get_surface_points(all_mesh[0]))


func get_surface_points(mesh: MeshInstance3D) -> Array[Vector3]:
	var surface_points  : Array[Vector3] = []

	if mesh.mesh and mesh.mesh is ArrayMesh:
		var array_mesh = mesh.mesh as ArrayMesh
		var surface_array = array_mesh.surface_get_arrays(0)  # Assuming surface 0

		if surface_array.size() > 0:
			var vertices = surface_array[ArrayMesh.ARRAY_VERTEX]

			for vertex in vertices:
				surface_points.append(vertex)

	return surface_points
