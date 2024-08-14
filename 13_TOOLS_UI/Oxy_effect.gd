extends Node


@onready var oxygene_miss_effet = $"../Oxygene_miss_effet"
@onready var oxygene_miss_effet_mat : Material = oxygene_miss_effet.get_material()

@onready var effect_test = $"../Oxy_vaine_effect"


var fade_out
var fade_out_timer : float = 1.0


@onready var check_effect_state : Timer = $check_effect_state
@onready var apply_timer : Timer = $Apply_timer

func _input(event):
	
	
	if event.is_action_pressed("debug_3"):
		effect_test._fade_out(1.0)
		takePhoto(1.0)
		

#func _ready():
	#_global_datas._go_Subscene.connect(start)
	#_global_datas._backFrom_subscene.connect(stop)
	
func start():
	check_effect_state.start()	
	_global_datas.oxy_current_state = game_state.oxy_state._no_effect
	
func stop():
	check_effect_state.start()	
	
func check_state():
	
	var oxygene_amount = _global_datas.clock_timer
	print(oxygene_amount)
	
	if apply_timer.is_stopped():
		apply_timer.start()	
	
	if oxygene_amount < 50:
		_global_datas.oxy_current_state = game_state.oxy_state._no_effect
		return

	if oxygene_amount > 50.0 && oxygene_amount < 100:
		_global_datas.oxy_current_state = game_state.oxy_state._low_effect
		apply_timer.wait_time = 8.0
		return
	
	if oxygene_amount > 100.0 && oxygene_amount < 180:
		_global_datas.oxy_current_state = game_state.oxy_state._mid_effect
		apply_timer.wait_time = 5.0
		
		return
		
	if oxygene_amount > 180.0 && oxygene_amount < 260:
		_global_datas.oxy_current_state = game_state.oxy_state._hard_effect
		apply_timer.wait_time = 3.0
		return
		
func apply_effect():
	
	if _global_datas.oxy_current_state == game_state.oxy_state._low_effect:
		takePhoto(0.5)	
	if _global_datas.oxy_current_state == game_state.oxy_state._mid_effect:
		effect_test._fade_out(1.0)
		takePhoto(1.0)
	if _global_datas.oxy_current_state == game_state.oxy_state._hard_effect:
		effect_test._fade_out(1.0)
		takePhoto(2.0)			
func takePhoto(fade_timer : float):

	await get_tree().create_timer(0.1).timeout
	var capture = get_viewport().get_texture().get_image() 
	var texture = ImageTexture.create_from_image(capture)
	oxygene_miss_effet.texture = texture
	
	if fade_out:
		fade_out.kill()
	fade_out = create_tween()
	fade_out.tween_method(set_value,1.0,0.0,2.0)
	
func set_value(value : float):
	oxygene_miss_effet_mat.set_shader_parameter("Opacity",value )	

	

func _on_check():
	check_state()	
	
func _on_apply():
	apply_effect()
