extends Node


@export var active_orber : bool = false
@export var minimum_closest_distance : float = 0.25

const BASE_ORBE_VISUAL_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_Visual_prefabs.tscn")
@onready var load_scene = $"../../LoadScene"


@export var show_stroke_id_debug = false

@export var orbe_stroke_maxLenght = 10;

@export var orber_tool : tool_data 
signal process_link(condition : bool, start_point : Vector3)


const TRACER_ZONE_PREFAB = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Tracer_Zone_prefab.tscn")
var is_tracing : bool



func _ready():
	
	if !active_orber:
		return
		
	_global_datas._instance_start_visual_orbe.connect(_instance_start_orbe)
	#_global_datas._instance_end_visual_orbe.connect(_instance_end_orbe)
	
	_global_datas._backFrom_subscene.connect(clear_orberSceneList)
	_global_datas._photo_flash.connect(stop_tracing)
	_global_datas._photo_flash.connect(delete_tracing_zone)
	orber_tool.cancel_action_signal.connect(stop_tracing)
	
func clear_orberSceneList():
	_global_datas._orbe_visual_scene.clear()
	process_link.emit(false,null)
	is_tracing = false

func delete_tracing_zone():
	is_tracing = false
	_global_datas._traceur_pause.emit(false)

func stop_tracing():
	process_link.emit(false,null)	

	
	
func _instance_start_orbe():
	
	if _global_datas._orbe_visual_scene.size() > orbe_stroke_maxLenght:
		return	
	
	
	if !is_tracing:
		print("INSTANCE TRACING ZONE")
		instance_tracing_zone()
	
		is_tracing = true
		_global_datas._traceur_pause.emit(true)	
		return
		
	#create orbe	
	#var orbe = BASE_ORBE_VISUAL_PREFABS.instantiate()
	#load_scene.add_child(orbe)
	#_global_datas._orbe_visual_scene.append(orbe)				
	#orbe.position  = get_target()	
	#process_link.emit(true,orbe.position)
	
	
func instance_tracing_zone():
	
	
	var _tracing_zone = TRACER_ZONE_PREFAB.instantiate()
	load_scene.add_child(_tracing_zone)
	var t_position = _global_datas._orbe_tool_origin_position #+ Vector3(0.0,0.05,0.0)
	_tracing_zone.position = t_position

	
func _instance_end_orbe():
	
	# HERE ONLY FOR VISUAL
	if _global_datas._orbe_visual_scene.size() > orbe_stroke_maxLenght:
		return	

	#create orbe	
	var orbe = BASE_ORBE_VISUAL_PREFABS.instantiate()
	load_scene.add_child(orbe)
	_global_datas._orbe_visual_scene.append(orbe)				
	orbe.position  = get_target()
	process_link.emit(true,orbe.position)
	# LINK ORBE AT THE END
	_global_datas._instance_stroke.emit()
	

func get_target():
	# check if target is far enough from actual orbe	
	var target = Vector3(_global_datas._orbe_tool_origin_position.x,_global_datas._orbe_tool_origin_position.y,0.1)
	var closest_orbe = closet_orbe(_global_datas._orbe_visual_scene)

	if closest_orbe:
		var closest_node = closest_orbe["node"]
		var closest_distance = closest_orbe["distance"]
		#print(closest_distance)
		if closest_node:
			if closest_distance < minimum_closest_distance:
				closest_node.is_closest.emit(true)
				target = closest_node.position	
	
	return target
	


	
func closet_orbe(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	
	for i in range(array.size()):
		var o = array[i]
		var player_sub = _global_datas._orbe_tool_origin_position
		var current_node_distance = player_sub.distance_to(o.position)
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = o
			closest_node_distance = current_node_distance	
	var result = {
		"node": closest_node,
		"distance": closest_node_distance
	}		
	return result
