extends Node

@export var Mirror_data: orbe_data
@export var teleporter_data: orbe_data

func _ready():
	_global_datas._photo_flash.connect(check_shape)

func check_shape():
	

	check_triangle()

	reset_orbe_list()
	
	
	
	
func check_triangle():	
	
	
		
	if is_equilateral_triangle(_global_datas._orbe_list):
		print("The points form an equilateral triangle.")
		_global_datas.instance_mirror_at_pos.emit(teleporter_data)
		return
		
	if is_circle(_global_datas._orbe_list):
		print("The points approximately form a circle.")
		_global_datas.instance_mirror_at_pos.emit(Mirror_data)
		return
	
			
func distance(point1, point2):
	# Calculate the distance between two points
	return sqrt((point2.position.x - point1.position.x)**2 + (point2.position.y - point1.position.y)**2)	

func angle(p1, p2, p3):
	
	# Calculate the angle between three points
	var v1 = Vector2(p1.position.x - p2.position.x, p1.position.y - p2.position.y)
	var v2 = Vector2(p3.position.x - p2.position.x, p3.position.y - p2.position.y)
	var dot_product = v1.dot(v2)
	var magnitude_v1 = v1.length()
	var magnitude_v2 = v2.length()
	var cos_theta = dot_product / (magnitude_v1 * magnitude_v2)
	
	return acos(cos_theta)
	
func is_equilateral_triangle(points):
	
	# Check if the points form an equilateral triangle
	if points.size() != 3:
		return false
		
	# Define a tolerance for comparing distances and angles
	var  TOLERANCE_DISTANCE = 0.25 # You can adjust this value based on your requirements
	var TOLERANCE_ANGLE = 20.0  # 10 degrees tolerance for angles
	
	

	# Calculate distances between points
	var distances = []
	for i in range(2):
		for j in range(i+1, 3):
			distances.append(distance(points[i], points[j]))

	
	# Check if all distances are approximately equal
	var max_distance = distances[0]
	var min_distance = distances[0]
	for dist in distances:
		max_distance = max(max_distance, dist)
		min_distance = min(min_distance, dist)
	if max_distance - min_distance > TOLERANCE_DISTANCE:
		return false

	# Calculate angles between points
	var angles = []
	for i in range(3):
		var j = (i + 1) % 3
		var k = (i + 2) % 3
		angles.append(angle(points[i], points[j], points[k]))

	  # Check if all angles are approximately 60 degrees
	for ang in angles:
		if abs(ang - PI/3) > TOLERANCE_ANGLE:
			return false
	return true

func is_circle(points):
	# Check if the points approximately form a circle
	if points.size() != 6:
		return false


	var  TOLERANCE_DISTANCE = 0.5
	
	# Calculate distances between points
	var distances = []
	for i in range(5):
		for j in range(i+1, 6):
			distances.append(distance(points[i], points[j]))

	# Check if all distances are approximately equal
	var max_distance = distances[0]
	var min_distance = distances[0]
	for dist in distances:
		max_distance = max(max_distance, dist)
		min_distance = min(min_distance, dist)
	if max_distance - min_distance > TOLERANCE_DISTANCE:
		return false

	return true

func reset_orbe_list():
	_global_datas._orbe_list.clear()

