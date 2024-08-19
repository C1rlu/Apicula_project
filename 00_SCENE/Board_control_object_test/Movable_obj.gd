extends Node

@export var collider : CollisionShape3D
@export  var limit_zone : Area3D

@export var move_root : Node3D
@export var rotation_root : Node3D

@export var On_Move : Node
@export var rotation_degrees : float = 45.0

@export var Render : MeshInstance3D
var Normal_material : Material
@export var moving_material : Material
@export var overlaping_object : Material

var rotating : bool
func _ready():
	_global_datas.moving_state.connect(move_is_active)
	
	On_Move.On_Move.connect(_On_move)
	On_Move._move.connect(_on_move)
	On_Move._rotate.connect(_on_rotate)

	
	if Render:
		Normal_material = Render.get_surface_override_material(0)
	
func move_is_active(condition : bool):
	collider.disabled = condition

func _On_move(condition):
	
	
	if _global_datas.limit_zone:
		return
	
	collider.disabled = condition
	
	if condition:
		_global_datas.moving_state.emit(true)
		_global_datas.select_movable_object.emit(On_Move)
		if Render:
			Render.set_surface_override_material(0,moving_material)
	else:
		_global_datas.moving_state.emit(false)
		_global_datas.select_movable_object.emit(null)
		if Render:
			Render.set_surface_override_material(0,Normal_material)
	

func _on_move(target, speed, delta):
	
	check_limit(target)
	#move_root.global_position = lerp(move_root.global_position,raycast_result.position,speed * delta)
	#var grid_target = get_closest_point(target.position)
	move_root.global_position = target.position

func _on_rotate(direction):	

	if rotating:
		return
		
	var t
	if t:
		t.kill()
		
	if direction == 1:
		var target_rotation = rotation_root.rotation_degrees.y + rotation_degrees
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
	if direction == -1:
		var target_rotation = rotation_root.rotation_degrees.y - rotation_degrees
		rotating = true
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		
func done():
	rotating = false
	

	
func check_limit(raycast_result)-> bool:
	
	if !limit_zone:
		return false

	var areas = limit_zone.get_overlapping_areas()
	if areas:
		for a in areas:
			var limit = a.get_node_or_null("Limit")	
			if limit:
				_global_datas.limit_zone = true
				Render.set_surface_override_material(0,overlaping_object)
				return true
	
	if raycast_result.normal != Vector3(0.0,1.0,0.0):
		_global_datas.limit_zone = true
		Render.set_surface_override_material(0,overlaping_object)
		return true
	
	_global_datas.limit_zone = false	
	Render.set_surface_override_material(0,moving_material)
	return false
	

					
func get_closest_point(_target : Vector3) -> Vector3:
	var closest_point : Vector3 
	var closest_distance = INF  # Set initial distance to a large value

	# Loop through all the grid points
	for p in _global_datas.grid_points:
		var distance = p.position.distance_squared_to(_target)  # Use squared distance to avoid unnecessary square root calculations
		
		if distance < closest_distance:
			closest_distance = distance
			closest_point = p.position  # Update the closest point
	
	return closest_point  # Return the closest point found


