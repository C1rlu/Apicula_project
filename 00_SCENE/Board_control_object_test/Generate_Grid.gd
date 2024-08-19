extends Node

@export var grid_area: MeshInstance3D

const GRID_POINT_PREFAB = preload("res://00_SCENE/Board_control_object_test/Grid_point/Grid_point_prefab.tscn")
@export var grid_root : Node3D

@export var disable = true
@export var _cell_size: float

func _ready():
	if disable:
		return
	
	# Get the grid_area's AABB and position
	var aabb = grid_area.get_aabb()
	var size = aabb.size
	var points = generate_grid_points(size.x, size.z, _cell_size, grid_area.global_transform,aabb.position.y + aabb.size.y)
	create_grid(points)

func generate_grid_points(width: float, depth: float, cell_size: float, grid_transform: Transform3D,top_y) -> Array:
	var num_cells_x = int(width / cell_size) + 1
	var num_cells_z = int(depth / cell_size) + 1
	var points: Array = []
	points.resize(num_cells_x * num_cells_z)

	var half_width = width / 2.0
	var half_depth = depth / 2.0

	# Calculate the grid points, applying grid_area's transform (including rotation)
	for i in range(num_cells_x):
		var x = -half_width + i * cell_size
		for j in range(num_cells_z):
			var z = -half_depth + j * cell_size
			# Apply grid_area's transformation including rotation
			var local_point = Vector3(x, top_y, z)
			var transformed_point = grid_transform * local_point
			points[i * num_cells_z + j] = transformed_point
	
	return points

func create_grid(points: Array):
	for p in points:
		var instance_p = GRID_POINT_PREFAB.instantiate()	
		grid_root.add_child(instance_p)
		instance_p.position = p
		_global_datas.grid_points.append(instance_p)
		#print(p)
