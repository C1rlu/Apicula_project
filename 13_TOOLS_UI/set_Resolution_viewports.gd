extends Node

@export var viewports : Array [SubViewport]


func _ready():
	_global_datas.set_resolution.connect(set_resolution)
	
func set_resolution(resolution : Vector2i):
	#var resolution = get_viewport().size
	for v in viewports:
		v.size = resolution

