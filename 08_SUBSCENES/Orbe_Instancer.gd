extends Node

const BASE_ORBE_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_prefabs.tscn")
const BASE_ORBE_VISUAL_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_Visual_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


@export var show_stroke_id_debug = false


@export var orbe_stroke_maxLenght = 10;

func _ready():
	
	_global_datas._instance_stroke.connect(_instance_stroke_at_pos)
	_global_datas._instance_visual_Orbe.connect(_instance_visual_orbe)

func _instance_stroke_at_pos():
	
	# HERE FOR DRAW POSITIONS 
	if _global_datas._orbe_visual_scene.size() > orbe_stroke_maxLenght:
		return
	
	var target = _global_datas._orbe_tool_origin_position
				
	var orbe = BASE_ORBE_PREFABS.instantiate()
	orbe.position  = target 
	load_scene.add_child(orbe)
	_global_datas._orbe_stroke_scene.append(orbe)

	# add the actual points in the stroke list
	var StrokeID = _global_datas._strokeID
	var newPoints = Points.Point.new(target.x * 100,target.y*100,StrokeID)
	_global_datas._orbe_stroke.append(newPoints)
	
	if show_stroke_id_debug:
		var string = "Points.Point.new("+str(newPoints.X)+","+str(newPoints.Y)+","+str(newPoints.StrokeID)+"),"
		print(string)

func _instance_visual_orbe():
	
	# HERE ONLY FOR VISUAL
	if _global_datas._orbe_visual_scene.size() > orbe_stroke_maxLenght:
		return
	
	var target = _global_datas._orbe_tool_origin_position
				
	var orbe = BASE_ORBE_VISUAL_PREFABS.instantiate()
	orbe.position  = target 
	load_scene.add_child(orbe)
	_global_datas._orbe_visual_scene.append(orbe)


