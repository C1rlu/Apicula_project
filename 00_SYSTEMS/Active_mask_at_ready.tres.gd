extends Node


@export var _active : Array[MeshInstance3D]

@export var _active_node : Array[Node3D]
func _ready():
	
	if _active:
		for e in _active:
			e.visible = true

	if _active_node:
		for e in _active_node:
			e.visible = true
