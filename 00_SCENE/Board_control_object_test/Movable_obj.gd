extends Node3D

@export var collider : CollisionShape3D
@export var rotation_root : Node3D
@export var move_root : Node3D
@export var On_Move : Node

var locked_points : Array
func _ready():
	_global_datas.switch_state.connect(move_is_active)
	update_grid_state()
	
func move_is_active(condition : bool):
	collider.disabled = condition
	
	update_grid_state()
	

		
	
func _on_on_click_on_move(condition):
	
	if condition:

		_global_datas.select_movable_object.emit(On_Move)
	else:
		_global_datas.select_movable_object.emit(null)	
	

	
func on_view():
	print("ON VIEW OBJECT")

func _on_move(target, speed, delta):
#	
	for p in locked_points:
		p.lock_position(false)	
	move_root.global_position = lerp(global_position,target,speed * delta)		
	#n_check_limit(target, speed, delta)
	#check_limit(target, speed, delta)
	
func _on_rotate(speed, delta):
	rotation_root.rotation_degrees.y += speed * delta	


	
func update_grid_state():
	
	var grid = _global_datas.grid_points
	
	for g in grid:
		var distance = global_position.distance_squared_to(g.position)		
		if distance < 0.025:
			g.lock_position(true)
			locked_points.append(g)

	
