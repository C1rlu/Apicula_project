extends Node
@onready var root = $".."


@export  var all_render : Node3D
@export var col : CollisionShape3D
@export var all_render_x_ray : Node3D
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
	col.call_deferred("set_disabled",!condition)
		
