extends Node3D


var is_moving : bool = false	
var target_pos : Vector3
@onready var fx_water = $Fx_water

func move_to(target : Vector3):
	
	is_moving = true	
	target_pos = target 
	
func _process(delta):
	
	if !is_moving:
		return
	
	var distance = global_position.distance_squared_to(target_pos)	
	if distance < 0.1:
		_disable()	 
		
	global_position = lerp(global_position,target_pos,3 * delta)

	
func _disable():
	is_moving = false
	
