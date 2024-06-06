extends Node3D


@export var list_col : Array[CollisionShape3D]

func _ready():
	for col in list_col:
		col.disabled = true
