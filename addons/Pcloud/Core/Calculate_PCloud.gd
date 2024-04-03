extends Node


# for drawing live gesture
const LINE_WIDTH := 2
const LINE_COLOR := Color(0.4, 0.6, 0.8)

var line_2d: Line2D
var list_line_2D : Array[Line2D]

var click

var current_stroke: Array[Vector2] = []
var strokes_index : int = 0
var strokes: Array #array of points


# CACHE ALL THE ACTUAL TEMPLATE
var templates_clouds : Array[Gesture]

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
		
		
func _ready():
	
	
	ini_template()

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Click_left"):
		
		click = true
		start_new_stroke()
		
	if event.is_action_released("Click_left"):
		#gesture_points.append(strokes.duplicate())
		end_stroke()
		click = false
		
	if event.is_action_pressed("Click_right"):
		recognize_gesture()
		
		clear_paths()
		
		
func recognize_gesture():
	
	var gesture = Gesture.new()	
	var normalized_current_stroke = gesture.normalize(strokes,gesture.SAMPLING_RESOLUTION)
	

	var Recognizer = Recognizer_cloud.new()

	var result = Recognizer.pRecognizer(normalized_current_stroke,templates_clouds)
	print(result)
	#for p in normalized_current_stroke:
		#print(p.x,p.y)	


	
# PATH PROCESS
func start_new_stroke():
	line_2d = Line2D.new()
	line_2d.width = LINE_WIDTH
	line_2d.default_color = LINE_COLOR
	add_child(line_2d)
	line_2d.owner = self


# Ends the current stroke and prepares for possible recognition
func end_stroke():
	
	strokes_index += 1
	
	for p in current_stroke:
		var new_points = Points.Pointa.new(p.x,p.y,strokes_index)
		#print("X ",new_points.X," Y ",new_points.Y," ID ",new_points.StrokeID)
		var string = "Points.Point.new("+str(new_points.X)+","+str(new_points.Y)+","+str(new_points.StrokeID)+"),"
		#print(string)
		strokes.append(new_points)
		
	list_line_2D.append(line_2d)
	line_2d = null
	current_stroke.clear()


func _process(_delta):
	if click:
		# point data
		var mousePosition = get_viewport().get_mouse_position()
		var m_position = Vector2(mousePosition.x, mousePosition.y)
		current_stroke.append(m_position)
		
		#visual
		update_gesture_path()	
			
# Updates the drawn path with the current gesture's points
func update_gesture_path() -> void:
	if line_2d:
		var points: PackedVector2Array = []
		for point in current_stroke:
			points.push_back(point)
		line_2d.points = points


# Clears all the paths after recognition or when no gesture is detected
func clear_paths():

	
	for line in list_line_2D:
		line.queue_free()
	list_line_2D.clear()
		
	strokes.clear()
	#gesture_points.clear()
	strokes_index = 0
