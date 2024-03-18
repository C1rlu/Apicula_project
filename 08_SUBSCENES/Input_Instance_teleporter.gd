extends Node

@export var teleporter_data : tool_data
@onready var vfx_sphere_mirror = $"../VFX_SPHERE_MIRROR"
var t
@onready var area = $"../ZoneCollide"

var magnet_list : Array

var active_magnet

func _ready():
	teleporter_data.tool_active_signal.connect(_play_tool)		
	
func _play_tool(condition : bool):
	
	if _global_datas.Player_InMirrorScene:
		return
		
	_click_teleporter(condition)	



func _click_teleporter(condition : bool):
	
	vfx_sphere_mirror.emitting = condition

	if t:
		t.kill()
	
	if condition:	
		t = create_tween()
		t.tween_method(change_value,0.5,3.0,0.5)
		#t.connect("finished",done)
		
		_global_datas._show_orbe_ui.emit()
		
	
	_magnet_element(condition)	
	
	
func done():
	
	_global_datas._instance_teleporter.emit()
	vfx_sphere_mirror.emitting = false
	
func change_value(value):
	vfx_sphere_mirror.speed_scale = value
	

func _magnet_element(condition : bool):
	
	var overlap_areas_ = area.get_overlapping_areas()

	if !condition:
		if active_magnet:
			active_magnet._magnet_me(false)	
		magnet_list.clear()
		return
		
	if overlap_areas_ == null:
		return
		
	for areas in overlap_areas_:
		var Magnet_node = areas.get_node_or_null("Orbe_Magnet")
		if  Magnet_node:
			magnet_list.append(Magnet_node)
			
	var closet_magnet = _closest_element(magnet_list)
	active_magnet = closet_magnet		
	
	if active_magnet:
		active_magnet._magnet_me(condition)	
				

		
		
func _closest_element(array):
	
	var closest_node = null
	var closest_node_distance = 0.0
	for element in array:
		var player_sub = _global_datas.subbscene_playerPosition
		var current_node_distance = player_sub.distance_to(element.get_magnet_position())
		if closest_node == null or current_node_distance < closest_node_distance:
			closest_node = element
			closest_node_distance = current_node_distance

	return closest_node
