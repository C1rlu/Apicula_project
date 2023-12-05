extends Node


@onready var main_root = $".."
@onready var timer = $Timer

var start_pos : Vector2
var dir : Vector2

func _apply_pos_anim():
	
	if !timer.is_stopped():
		return
		
	var random_x = randf_range(-10.0, 10.0)
	var random_y = randf_range(-10.0, 10.0)
	dir = main_root.global_position + Vector2(random_x,random_y)
	start_pos = main_root.global_position
	
	var randomWaitTime = randf_range(0.05, 0.1)
	timer.wait_time = randomWaitTime
	timer.start()	


func _apply_pos_agains():
	
	if !timer.is_stopped():
		return
		
	var random_x = randf_range(-2.5, 2.5)
	var random_y = randf_range(-2.5, 2.5)
	dir = main_root.global_position + Vector2(random_x,random_y)
	start_pos = main_root.global_position
	
	var randomWaitTime = randf_range(0.05, 0.1)
	timer.wait_time = randomWaitTime
	timer.start()	
	
	

func _on_take_object_pos_anim():
	if !timer.is_stopped():
		return
	timer.stop()
	_apply_pos_anim()

func _process(delta):
	if timer.is_stopped():
		return
	
	main_root.global_position = lerp(start_pos,dir,timer.time_left / timer.wait_time)
	
	
	


func _on_timer_timeout():
	timer.stop()



func _on_apply_pos_behind_move_behind():
	
	if !timer.is_stopped():
		return
	timer.stop()
	_apply_pos_agains()




