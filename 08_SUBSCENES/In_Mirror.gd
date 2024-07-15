extends Node
@onready var root = $".."

@onready var all_render = $"../All_render"
@onready var col = $"../All_render/All_render/CollisionShape3D"
@onready var all_render_x_ray = $"../All_render_X_ray"
@onready var photo_data = $"../Photo_data"

var exit_index : int = 0

var out_of_mirror : bool = false



func _ready():
	
	_global_datas.in_mirror_zone.connect(in_mirror)
	
func in_mirror(condition : bool):
	
	all_render.visible = condition
	col.disabled = !condition			
		
func start_exit():
	
	if out_of_mirror:
		return
		
	if all_render.visible:
		return
	exit_index += 1	
	
	if exit_index == 3:
		all_render.visible = true
		col.disabled = false
		all_render_x_ray.visible = false
		photo_data._in_mirror = false
		out_of_mirror = true
		
func _on_timer_timeout():
	exit_index = 0
