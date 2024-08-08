extends Node
@onready var root = $".."

@onready var all_render = $"../All_render"
@onready var col = $"../All_render/All_render/CollisionShape3D"
@onready var all_render_x_ray = $"../All_render_X_ray"
@onready var photo_data = $"../Photo_data"

var exit_index : int = 0

var out_of_mirror : bool = false

@export var State_selected : game_state.visible_state

func _ready():
	
	_global_datas.in_mirror_zone.connect(check_in_mirror)
	check_in_mirror()
func check_in_mirror():
	
	if _global_datas.player_state == State_selected:
		show(true)
	else:
		show(false)			
				
						
func show(condition):
	all_render.visible = condition
	all_render_x_ray.visible = !condition
	#col.disabled = !condition
	col.call_deferred("set_disabled",!condition)
			
func start_exit():
	
	if out_of_mirror:
		return
		
	if all_render.visible:
		return
	exit_index += 1	
	
	if exit_index == 3:
		show(true)
		out_of_mirror = true
		
func _on_timer_timeout():
	exit_index = 0
