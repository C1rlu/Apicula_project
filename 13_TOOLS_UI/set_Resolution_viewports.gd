extends Node

@export var viewports : Array [SubViewport]


func _ready():
	set_resolution()
	
	
func set_resolution():
	var resolution = get_viewport().size
	for v in viewports:
		v.size = resolution

