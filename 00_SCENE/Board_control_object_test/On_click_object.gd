extends Node

@export var Root : Node3D
signal On_Move(condition : bool)
signal _move(rayCast_result : Dictionary ,speed : float ,delta : float)
signal _rotate(direction : float)

func get_object() -> Node3D:
	return Root

