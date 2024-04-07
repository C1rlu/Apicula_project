extends Node
@onready var root = $".."
@onready var stop_follow_timer = $Stop_follow_timer

var move : bool = false
var random_offset : Vector3
var idle_position : Vector3
func _ready():
	
	_global_datas._photo_flash.connect(reload_follow)
	idle_position = root.global_position
func move_oddity():
	
	move = true
	random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)
	stop_follow_timer.start()
	
	
func reload_follow():
	
	if move:
		move_oddity()
	
func _process(delta):
	
	
	if !move:
		_idle(delta)
		return	
		
	_folow_player(delta)
	

func _folow_player(delta):


	var player_position = _global_datas.subbscene_playerPosition + random_offset	
	root.global_position = lerp(root.global_position,player_position, 1 * delta)			

func _idle(delta):


	var target = idle_position + random_offset	
	root.global_position = lerp(root.global_position,target , 1 * delta)			


func _on_random_range_update_timeout():
	
	if !move:
		random_offset = Vector3(randf_range(-0.2,0.2),randf_range(-0.2,0.2),0.0)
	else:
		random_offset = Vector3(randf_range(-0.5,0.5),randf_range(-0.5,0.5),0.0)	

func _on_stop_follow_timer_timeout():
	move = false
	idle_position = root.global_position
