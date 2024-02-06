extends Node

@onready var main_root = $".."

var start_pos : Vector2
var dir : Vector2

var t

func _ready():
	_global_datas._boat_contact.connect(_contact_anim)

func _move_to(value : float):
	
	dir.x = clamp(dir .x,0,1920)
	dir.y = clamp(dir .y,0,1080)
	main_root.global_position = lerp(start_pos,dir,value)
		
func _contact_anim(pos : Vector2, strenght : float):
	
	if t:
		t.kill()
	t = create_tween()
	
	#dir = main_root.global_position + pos * (strenght * 15)
	var random_x = randf_range(-5.0, 5.0)
	var random_y = randf_range(-5.0, 5.0)
	dir = main_root.global_position + Vector2(random_x,random_y)
	start_pos = main_root.global_position
	
	var randomWaitTime = randf_range(0.1, 0.25)
	
	
	t .tween_method(_move_to,0.0,1.0,randomWaitTime).set_trans(Tween.TRANS_SINE)	

func _apply_pos_anim(value : float):
	
	if t:
		t.kill()
	t = create_tween()
	
	var random_x = randf_range(-value, value)
	var random_y = randf_range(-value, value)
	dir = main_root.global_position + Vector2(random_x,random_y)
	start_pos = main_root.global_position
	
	var randomWaitTime = randf_range(0.05, 0.1)
	
	
	t .tween_method(_move_to,0.0,1.0,randomWaitTime).set_trans(Tween.TRANS_SINE)


func _on_apply_pos_behind_move_behind():
	# external signal
	_apply_pos_anim(5.0)




