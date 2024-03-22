extends Node

@export var viewports : Array [SubViewport]


func _ready():
	_global_datas.set_resolution.connect(set_resolution)
	
func set_resolution(resolution : Vector2i):

	for v in viewports:
		v.size = resolution
		
		v.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
		v.scaling_3d_scale = 1.0
		
		v.render_target_update_mode = SubViewport.UPDATE_WHEN_VISIBLE
	
