extends Node
@onready var root = $".."

@onready var all_render = $"../All_render"
@onready var col = $"../All_render/All_render/CollisionShape3D"
@onready var all_render_x_ray = $"../All_render_X_ray"
@onready var photo_data = $"../Photo_data"


func start_exit():
	
	if all_render.visible:
		return
		
	all_render.visible = true
	col.disabled = false
	all_render_x_ray.visible = false
	photo_data._in_mirror = false
		


func _on_photo_data_on_scanning_done():
	start_exit()
