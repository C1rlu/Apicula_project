extends Object


class_name Gesture

var points : Array # gesture points (normalized)
var Name : String 
const SAMPLING_RESOLUTION : int = 32;



func normalize(points, n):
	# Step 1: Resample points
	points = resample(points, n)
	
	# Step 2: Scale points
	points = scale(points)
	
	# Step 3: Translate points to the origin
	points = translate_to_origin(points)
	
	return points

func resample(points: Array, n: int) -> Array:
	var new_points = []
	new_points.append(Points.Pointa.new(points[0].X, points[0].Y, points[0].StrokeID))
	var num_points = 1

	var path_length = calculate_path_length(points)
	var I = path_length / (n - 1) # computes interval length
	var D = 0

	for i in range(1, points.size()):
		if points[i].StrokeID == points[i - 1].StrokeID:
			var d = euclidean_distance(points[i - 1], points[i])
			if D + d >= I:
				var first_point = points[i - 1]
				while D + d >= I:
					# add interpolated point
					var t = min(max((I - D) / d, 0.0), 1.0)
					if t != t: # Check if t is NaN
						t = 0.5
					new_points.append(Points.Pointa.new(
						(1.0 - t) * first_point.X + t * points[i].X,
						(1.0 - t) * first_point.Y + t * points[i].Y,
						points[i].StrokeID
					))
					num_points += 1

					# update partial length
					d = D + d - I
					D = 0
					first_point = new_points[num_points - 1]

				D = d
			else:
				D += d

	if num_points == n - 1: # sometimes we fall a rounding-error short of adding the last point, so add it if so
		new_points.append(Points.Pointa.new(points[points.size() - 1].X, points[points.size() - 1].Y, points[points.size() - 1].StrokeID))

	return new_points
	
# Scale function
func scale(points: Array) -> Array:
	
  # Initialize variables for bounding box calculation
	var minx: float = INF
	var maxx: float = -INF
	var miny: float = INF
	var maxy: float = -INF
	
	# Calculate the bounding box
	for point in points:
		if minx > point.X:
			minx = point.X
		if miny > point.Y:
			miny = point.Y
		if maxx < point.X:
			maxx = point.X
		if maxy < point.Y:
			maxy = point.Y

	# Determine the scaling factor to fit the bounding box within [0..1] × [0..1]
	var scale = max(maxx - minx, maxy - miny)

	# Rescale the points
	var newPoints = []
	for point in points:
		var scaledX = (point.X - minx) / scale
		var scaledY = (point.Y - miny) / scale
		# Assuming Point is defined in your script
		var newPoint = Points.Pointa.new(scaledX, scaledY, point.StrokeID)
		newPoints.append(newPoint)

	return newPoints

# Function to translate points to the origin (0, 0)
func translate_to_origin(points):
	var centroid = Vector2(0, 0)
	
	for p in points:
		var point_pos = Vector2(p.X,p.Y)
		centroid += point_pos
	centroid /= points.size()

	var newPoints = []
	for p in points:
		var translatedPoint = Vector2(p.X - centroid.x, p.Y - centroid.y)
		newPoints.append(translatedPoint)
	
	return newPoints

# Path Length function
func calculate_path_length(points: Array) -> float:
	var length = 0
	
	for i in range(1, points.size()):
		var pi = points[i]
		var piPrev = points[i - 1]
		
		if pi.StrokeID == piPrev.StrokeID:
			# Assuming points contain position information accessible via X and Y properties
			var point1 = Vector2(piPrev.X, piPrev.Y)
			var point2 = Vector2(pi.X, pi.Y)
			
			length += euclidean_distance(piPrev, pi)
	
	return length

# Squared Euclidean Distance function
func euclidean_distance(a, b) -> float:
	return (a.X - b.X) ** 2 + (a.Y - b.Y) ** 2
