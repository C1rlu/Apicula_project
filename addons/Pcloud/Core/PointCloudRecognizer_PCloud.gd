
extends Object

class_name Recognizer_cloud

# P-Recognizer (Points points, Templates templates)
func pRecognizer(points : Array, templates: Array) -> Array:
	var n = 32 # number of points
	var score = INF;
	var result = null
	var gesture_class = ""
	for template in templates:
		var d = greedy_cloud_match(points, template.points)
		
		if score > d:
			score = d
			gesture_class  = template.Name
		
	score = max((2.0 - score) / 2.0, 0.0) # normalize score in [0..1]

	return [gesture_class , score]

func classify(candidate: Array, training_set: Array) -> String:
	var min_distance = INF;
	var gesture_class = ""
	for template in training_set:
		var dist = greedy_cloud_match(candidate, template.points)
		if dist < min_distance:
			min_distance = dist
			gesture_class = template.Name
	return gesture_class
	
	
func greedy_cloud_match(points1: Array, points2: Array) -> float:
	var n = points1.size() # the two clouds should have the same number of points by now
	var eps = 0.5 # controls the number of greedy search trials (eps is in [0..1])
	var step = int(floor(pow(n, 1.0 - eps)))
	var min_distance = INF;
	for i in range(0, n, step):
		var dist1 = cloud_distance(points1, points2, i)   # match points1 --> points2 starting with index point i
		var dist2 = cloud_distance(points2, points1, i)   # match points2 --> points1 starting with index point i

		min_distance = min(min_distance, min(dist1, dist2))
		
	return min_distance

func cloud_distance(points1: Array, points2: Array, start_index: int) -> float:
	var n = points1.size() # the two clouds should have the same number of points by now
	
	var matched = [] # matched[i] signals whether point i from the 2nd cloud has been already matched
	for i in range(n):
		matched.append(false) # no points are matched at the beginning

	var sum = 0.0  # computes the sum of distances between matched points (i.e., the distance between the two clouds)
	var i = start_index
	while true:
		var index = -1
		var min_distance = INF;
		for j in range(n):
			if not matched[j]:
				var dist = sqr_euclidean_distance(points1[i], points2[j]) # use squared Euclidean distance to save some processing time
				
				if dist < min_distance:
					min_distance = dist
					index = j
		
		matched[index] = true # point index from the 2nd cloud is matched to point i from the 1st cloud
		
		var weight = 1.0 - ((i - start_index + n) % n) / float(n)
		
		sum += weight * min_distance # weight each distance with a confidence coefficient that decreases from 1 to 0
		
		i = (i + 1) % n
		
		if i == start_index:
			break
	
	return sum

# Squared Euclidean Distance function
func sqr_euclidean_distance(a: Vector2, b: Vector2) -> float:
	return (a.x - b.x) ** 2 + (a.y - b.y) ** 2
