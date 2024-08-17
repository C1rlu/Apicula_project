extends Node

@onready var movable_obj = $"../.."

signal On_Move(condition : bool)

signal On_Position(Position : Node3D)

func get_obj():
	return movable_obj 
