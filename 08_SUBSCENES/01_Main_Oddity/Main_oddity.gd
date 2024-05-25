extends Node

@onready var rapatrier_rg : RigidBody3D = $".."

@export var position_from_player : Vector3
@export var speed : float
@onready var root = $".."
@onready var wait_before_follow = $Wait_before_follow
var actual_speed : float
var move : bool = false
var random_offset : Vector3
var idle_position : Vector3
var can_check_cloest_path = false

var path_index : int

var close_to_player : bool  = false
var path_to_player : Array[Vector3]

var is_paused : bool

func _ready():

	idle_position = root.global_position
	actual_speed = speed
	
	_global_datas._traceur_pause.connect(_set_paused)	
	
	
func _set_paused(condition : bool):
	is_paused = condition	
	
func move_oddity():
	
	
	if move:
		return
		
	random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)


	move = true	
	

func _process(delta):
	
	if !_global_datas.Player_InSubScene:
		return
	if _global_datas.Player_In_Inventory:
		return	
	if is_paused:
		return
	
	_folow_player(delta)
	

func _folow_player(delta):
	

	#var player_position = _global_datas.subbscene_playerPosition + position_from_player + random_offset	
	
	if close_to_player :
		pass
		#var direction = (player_position - rapatrier_rg.global_position).normalized()
		#rapatrier_rg.apply_central_force(direction * speed/5)
		#root.global_position = lerp(root.global_position,player_position, actual_speed * delta)			
	else:	
				
		follow_path(delta)


func follow_path(delta):
	
	var player_position = _global_datas.subbscene_playerPosition + position_from_player/2 + random_offset/2	
	path_to_player.append(player_position)
	
	if path_to_player[path_index] == null:
		return
		
	var target_point = path_to_player[path_index]
	var direction = (target_point - rapatrier_rg.global_position).normalized()
	
	var distance_next_points = target_point.distance_to(root.position) 
	
	if distance_next_points < 1.0:
		path_index += 1 
	
	rapatrier_rg.apply_central_force(direction * speed)
	#root.global_position = lerp(root.global_position,target_point , actual_speed * 2 * delta)	
	
	
func closest_index_to_player():
	var _index : int = 0
	
	for	position in _global_datas.player_paths:
		_index += 1	
		var distance = position.distance_to(root.global_position)  					
		if distance < 0.5:
			return _index


func _on_random_range_update_timeout():
	
	if !move:
		random_offset = Vector3(randf_range(-0.2,0.2),randf_range(-0.2,0.2),0.0)
	else:
		random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)	
		
		
	actual_speed = speed + randf_range(-0.2,0.2)


func _on_movable_oddity_example_body_entered(body):
	
	if body:
		var player = body.get_node_or_null("Player_rg")
		if player:
			#print("CLOSE TO PLAYER")
			close_to_player = true
		

func _on_movable_oddity_example_body_exited(body):
	if body:
		var player = body.get_node_or_null("Player_rg")
		if player:
			path_to_player.clear()
			path_index = 0
		
			var tree = is_inside_tree()
	
			if tree:
				wait_before_follow.start()

	
func _on_wait_before_follow_timeout():
	close_to_player = false	

