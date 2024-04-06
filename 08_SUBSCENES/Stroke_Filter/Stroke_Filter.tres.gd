extends Node

@export var Teleporter_Orbe : orbe_data
@export var Mirror_Orbe : orbe_data
@export var Mirror_Orbe_out : orbe_data

@export var Remover : orbe_data

# CACHE ALL THE ACTUAL TEMPLATE
var templates_clouds : Array[Gesture]


# Example usage:
func _ready():
	
	_global_datas._photo_flash.connect(check)
	_global_datas._backFrom_subscene.connect(check)
	ini_template()

func check():
	
	
	if _global_datas._orbe_stroke.size() < 25:
		_global_datas._orbe_stroke.clear()
		reset_stroke()
		return
	if !_global_datas._orbe_stroke:
		return
			
	recognize_gesture(_global_datas._orbe_stroke)

	_global_datas._orbe_stroke.clear()
	

func recognize_gesture(strokes):
	
	var gesture = Gesture.new()	
	var normalized_current_stroke = gesture.normalize(strokes,gesture.SAMPLING_RESOLUTION)
	

	var Recognizer = Recognizer_cloud.new()

	var result = Recognizer.pRecognizer(normalized_current_stroke,templates_clouds)

	result_condition(result)
	reset_stroke()
		
func reset_stroke():
	
	_global_datas._strokeID = 0
	
	for o in _global_datas._orbe_stroke_scene:
		o.queue_free()
		
	_global_datas._orbe_stroke_scene.clear()
	
	for v in _global_datas._orbe_visual_scene:
		v.queue_free()
		
	_global_datas._orbe_visual_scene.clear()
	
	
	
func result_condition(result):
	
	if result[1] > 0.9:
		print(result)
		var calculate_center = center_of_mass_points()
		
		if result[0] == "line_1" or result[0] == "line_2" or result[0] == "line_3" or result[0] == "line_4":
			_global_datas.instance_orbe_result.emit(Remover,calculate_center)		
		
	
		if result[0] == "Time":
			
			if _global_datas.Mirror_vortex_Node:
				return	
			if !_global_datas.Player_InMirrorScene:
				
				if !_global_datas.Mirror_vortex_Node:
					_global_datas.instance_orbe_result.emit(Mirror_Orbe,calculate_center)
				else:
					_global_datas.Mirror_vortex_Node.position = calculate_center		
			else:
				if !_global_datas.Mirror_vortex_out_Node:
					_global_datas.instance_orbe_result.emit(Mirror_Orbe_out,calculate_center)
				else:
					_global_datas.Mirror_vortex_out_Node.position = calculate_center	
					
					
					
		if result[0] == "teleporter":
			_global_datas.instance_orbe_result.emit(Teleporter_Orbe,calculate_center)
			
func center_of_mass_points()->Vector3:
	
	var center = Vector3.ZERO#_global_datas._orbe_stroke_scene[0].position
	 # Calculate the sum of all points
	for point in _global_datas._orbe_visual_scene:
		center += point.position
	
	# Divide the sum by the number of points to get the average
	if _global_datas._orbe_visual_scene.size() > 0:
		center /= _global_datas._orbe_visual_scene.size()	
	
	
	return center
	
	
#_global_datas._orbe_stroke_scene	
func ini_template():
	
	var template = Cloud_Template.new()
	

	for cloud_name in template.predefined_point_cloud.keys():

		var gesture = Gesture.new()
		var points = template.predefined_point_cloud[cloud_name]
		var point_normalized = gesture.normalize(points,gesture.SAMPLING_RESOLUTION)
		gesture.Name = cloud_name
		for point in point_normalized:
			gesture.points.append(point)
	
		templates_clouds.append(gesture)		
		#print(cloud_name)
		
		
