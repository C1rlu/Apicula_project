extends Node

@export var information : info_data

@onready var root = $"../.."
@onready var engine = $"../../Main_Oddity/Render_root/Main_render_msh/Engine"

var t 



@onready var actual_scale = engine.scale.x 

@onready var timer = $Timer
@onready var gpu_eat_vfx = $"../../GPU_eat_vfx"
@onready var mirror_element_oddity = $"../../Mirror_element_oddity"

signal active_flash_mirror
signal active_rotation

func _ready():
	_global_datas._photo_flash.connect(check_distance)

	
func check_distance():
	
	if mirror_element_oddity.State_selected != _global_datas.player_state:
		return
	
	var distance_to_player = root.global_position.distance_to(_global_datas.subbscene_playerPosition) 	
	if distance_to_player < 2.0:
		Bounce_engine()	
		
		active_flash_mirror.emit()
		active_rotation.emit()

		_global_datas.information_added.emit(information)

		
		
func Bounce_engine():
	
	gpu_eat_vfx.emitting = true
	
	if t:
		t.kill()
	
	var random_bounce = randf_range(0.6,0.7)	
	var random_time = randf_range(0.25,0.4)	
	var new_size = Vector3(random_bounce,random_bounce,random_bounce)
	t = create_tween()
	t.tween_property(engine,"scale",new_size,random_time).set_trans(Tween.TRANS_SPRING)
	t.connect("finished",Bounce_engine_reset)
	
func Bounce_engine_reset():
	
	if t:
		t.kill()
	
	var random_bounce = 1.0
	var random_time = randf_range(0.25,0.6)	
	var new_size = Vector3(random_bounce,random_bounce,random_bounce)
	t = create_tween()
	t.tween_property(engine,"scale",new_size,random_time).set_trans(Tween.TRANS_SPRING)
	
	
func _on_timer_timeout():
	Bounce_engine()
