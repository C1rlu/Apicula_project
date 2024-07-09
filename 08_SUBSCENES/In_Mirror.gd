extends Node
@onready var root = $".."

@onready var all_render = $"../All_render"
@onready var col = $"../All_render/All_render/CollisionShape3D"
@onready var all_render_x_ray = $"../All_render_X_ray"
@onready var photo_data = $"../Photo_data"

var exit_index : int = 0


func start_exit():
	
	if all_render.visible:
		return
	exit_index += 1	
	
	if exit_index == 3:
		all_render.visible = true
		col.disabled = false
		all_render_x_ray.visible = false
		photo_data._in_mirror = false
		_global_datas.out_mirror_element.emit(root.global_position)
		
func _on_timer_timeout():
	exit_index = 0
