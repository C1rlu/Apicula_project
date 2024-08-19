extends Node

@export var Root : Node3D
signal On_Move(condition : bool)
signal _move(target : Vector3,speed : float ,delta : float)
signal _rotate(speed : float ,delta : float)

func get_object() -> Node3D:
	return Root

