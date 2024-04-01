extends Node

const LINER_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Liner_prefabs.tscn")
@onready var load_scene = $"../../../LoadScene"

@onready var timer = $Timer


func _ready():
	_global_datas._instance_visual_Orbe.connect(start)
	
	
func start():	
	timer.start()	

func link_stroke():
	
	print(_global_datas._orbe_visual_scene.size())
	
	if _global_datas._orbe_visual_scene.size() < 2:
		return

	

	var start_line_index = _global_datas._orbe_visual_scene.size()-2	
	var start_line = _global_datas._orbe_visual_scene[start_line_index]
	
	
	var end_line_index = _global_datas._orbe_visual_scene.size()-1
	var end_line = _global_datas._orbe_visual_scene[end_line_index]
	

	var line_stroke = calculateLineOfDots(start_line.position,end_line.position,0.01)

	for dots in line_stroke:
		var instance_dots = LINER_PREFABS.instantiate()
		instance_dots.position = dots		
		load_scene.add_child(instance_dots)	
		
		
	print("STROKE")	
		
func calculateLineOfDots(start_pos: Vector3, end_pos: Vector3, dot_spacing: float) -> Array:
	var dot_positions = []
	var distance = (end_pos - start_pos).length()
	var num_dots = distance / dot_spacing
	
	for i in range(num_dots):
		var t = i / (num_dots - 1)
		var dot_pos = start_pos + (end_pos - start_pos) * t
		dot_positions.append(dot_pos)
	
	return dot_positions


func _on_timer_timeout():
	link_stroke()	
	
