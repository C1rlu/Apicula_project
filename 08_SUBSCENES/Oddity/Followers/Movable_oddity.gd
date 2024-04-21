extends Node

@export var _Oddity_data : Oddity_data
@export var position_from_player : Vector3
@export var speed : float
@onready var root = $".."
@onready var stop_follow_timer = $Stop_follow_timer

var move : bool = false
var random_offset : Vector3
var idle_position : Vector3

var Mirror_element : Node
var Photo_data : Node

var rotation_target : Vector3

signal kill_this

var can_check_cloest_path = false

var path_index : int

var close_to_player : bool  = false
var path_to_player : Array[Vector3]
func _ready():

	idle_position = root.global_position

	Mirror_element = get_node_or_null("../Mirror_elements")
	Photo_data = get_node_or_null("../Scanner_Area/Photo_data")
	rotation_target = Vector3(randf_range(-90.0,90.0),randf_range(-90.0,90.0),randf_range(-90.0,90.0))
	
func move_oddity():
	
	
	if move:
		return
		
	random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)

	if Mirror_element:
		Mirror_element._follow_player = true 
	
	if Photo_data:
		Photo_data.disable_photoData()
	
	_global_datas._peon_oddity_following.append(self)
	_global_datas.add_oddity_to_inventory.emit(_Oddity_data)
	
	move = true	
	
func follow_from_inventory():
	
	if move:
		return
		
	random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)

	
	if Mirror_element:
		Mirror_element._follow_player = true
	
	if Photo_data:
		Photo_data.disable_photoData()
	
	_global_datas._peon_oddity_following.append(self)
	
	move = true		
	
func reload_follow():
	
	if move:
		move_oddity()
	
func _process(delta):
	
	
	if !move:
		_idle(delta)
		return	
		
	_folow_player(delta)
	

func _folow_player(delta):
	
	#_global_datas.player_paths
	var player_position = _global_datas.subbscene_playerPosition + position_from_player + random_offset	
	
	if close_to_player :
		root.global_position = lerp(root.global_position,player_position, speed * delta)			
		root.global_rotation = lerp(root.global_rotation,rotation_target, 0.1 * delta)
		
	else:	
				
		follow_path(delta)


func follow_path(delta):
	
	var player_position = _global_datas.subbscene_playerPosition + position_from_player/2 + random_offset/2	
	path_to_player.append(player_position)
	
	if path_to_player[path_index] == null:
		return
		
	var target_point = path_to_player[path_index]
	
	var distance_next_points = target_point.distance_to(root.position) 
	
	if distance_next_points < 0.5:
		path_index += 1 
		

	root.global_position = lerp(root.global_position,target_point , speed * 2 * delta)	
	root.global_rotation = lerp(root.global_rotation,rotation_target, 0.1 * delta)
func closest_index_to_player():
	var _index : int = 0
	
	for	position in _global_datas.player_paths:
		_index += 1	
		var distance = position.distance_to(root.global_position)  					
		if distance < 0.5:
			return _index


		
func _idle(delta):

	var target = idle_position + random_offset	
	root.global_position = lerp(root.global_position,target , 1 * delta)			

	root.global_rotation = lerp(root.global_rotation,rotation_target, 0.05 * delta)
	

func _on_random_range_update_timeout():
	
	if !move:
		random_offset = Vector3(randf_range(-0.2,0.2),randf_range(-0.2,0.2),0.0)
	else:
		random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)	
		rotation_target = Vector3(randf_range(-90.0,90.0),randf_range(-90.0,90.0),randf_range(-90.0,90.0))
		
func _on_stop_follow_timer_timeout():
	move = false
	idle_position = root.global_position



func _on_tree_exited():
	
	_global_datas._peon_oddity_following.erase(self)
	
	if !_global_datas.Player_InSubScene:
		return
	_global_datas.remove_oddity_to_inventory.emit(_Oddity_data)
	


func _on_movable_oddity_example_follow():
	follow_from_inventory()


func _on_movable_oddity_example_body_entered(body):
	
	if body:
		var player = body.get_node_or_null("Player")
		if player:
			
			close_to_player = true
			
			print(player,"enter")
			

func _on_movable_oddity_example_body_exited(body):
	if body:
		var player = body.get_node_or_null("Player")
		if player:
			path_to_player.clear()
			path_index = 0
			close_to_player = false
			print(player,"exist")
