extends Node

const LINER_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Liner_prefabs.tscn")
@onready var load_scene = $"../../../LoadScene"

@onready var timer = $Timer

@export var show_stroke_id_debug = false
func _ready():
	#_global_datas._instance_visual_Orbe.connect(start)
	_global_datas._instance_stroke.connect(start)
	
func start():	
	timer.start()	

func link_stroke():
	
	
	if !_global_datas._orbe_visual_scene:
		return
	if _global_datas._orbe_visual_scene.size() < 2:
		return

	var start_line_index = _global_datas._orbe_visual_scene.size()-2	
	var start_line = _global_datas._orbe_visual_scene[start_line_index]
	
	
	var end_line_index = _global_datas._orbe_visual_scene.size()-1
	var end_line = _global_datas._orbe_visual_scene[end_line_index]
	

	var line_stroke = calculateLineOfDots(start_line.position,end_line.position,0.05)

	for dots in line_stroke:
		var instance_dots = LINER_PREFABS.instantiate()
		instance_dots.position = dots		
		load_scene.add_child(instance_dots)	
		
		create_point(dots)
		
	
func create_point(point_target : Vector3):
	
	var target = point_target
				
	# add the actual points in the stroke list
	var StrokeID = _global_datas._strokeID
	var newPoints = Points.Pointa.new(target.x * 100,target.y*100,StrokeID)
	_global_datas._orbe_stroke.append(newPoints)
	
	if show_stroke_id_debug:
		var string = "Points.Pointa.new("+str(newPoints.X)+","+str(newPoints.Y)+","+str(newPoints.StrokeID)+"),"
		print(string)
				
func calculateLineOfDots(start_pos: Vector3, end_pos: Vector3, dot_spacing: float) -> Array:
	
	var dot_positions = []
	var distance = (end_pos - start_pos).length()
	var num_dots = distance / dot_spacing
	
	for i in range(num_dots):
		var t = i / (num_dots - 1)
		var dot_pos = start_pos + (end_pos - start_pos) * t
		dot_positions.append(dot_pos)
	
	return dot_positions


func closet_orbe(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	
	for i in range(array.size()-1):
		var o = array[i]
		var player_sub = _global_datas.subbscene_playerPosition	
		var current_node_distance = player_sub.distance_to(o.position)
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = o
			closest_node_distance = current_node_distance	
			
	return closest_node		


func _on_timer_timeout():
	
	if !_global_datas._orbe_visual_scene:
		return
		
	if !_global_datas.Player_InSubScene:
		return
	link_stroke()	
	
