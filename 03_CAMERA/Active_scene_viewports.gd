extends Node

@export var viewports : Array [SubViewport]

func _active_viewports(condition : bool):
	
	for v in viewports:
		if condition:
			v.render_target_update_mode = SubViewport.UPDATE_WHEN_VISIBLE
		else:
			v.render_target_update_mode = SubViewport.UPDATE_ONCE

