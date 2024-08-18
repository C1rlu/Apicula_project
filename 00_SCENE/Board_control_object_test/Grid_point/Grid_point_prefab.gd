extends Node3D

@export var free : Node3D
@export var lock : Node3D
var object_parent : Node3D

var is_lock : bool = false
func lock_position(condition :bool):
	
	free.visible = !condition	
	lock.visible = condition
	is_lock = condition
