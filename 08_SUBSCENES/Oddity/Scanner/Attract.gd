extends Node

@export var rg : RigidBody3D

var _attract_me : bool = false
var target_dir : Vector3
var value : float = 0

func attract_me(condition, position, f_signal):
	
	_attract_me = condition
	target_dir = position
	
	if condition:
		f_signal.connect(change_value)
	else:
		f_signal.disconnect(change_value)
			
func change_value(_value : float):
	value = _value
	
	
func _process(delta):
	
	if _attract_me:
		var direction = (target_dir  - rg.global_position).normalized()	
		rg.apply_central_force(direction * 250 * delta * value)
	
