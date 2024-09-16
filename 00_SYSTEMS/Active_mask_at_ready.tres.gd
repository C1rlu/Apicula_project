extends Node


@export var _active : Array[MeshInstance3D]


func _ready():
	
	if _active:
		for e in _active:
			e.visible = true
