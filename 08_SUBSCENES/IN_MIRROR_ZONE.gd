extends Node

@onready var mirror_view = $"../Viewport/Mirror_view"
var f
func _ready():
	_global_datas.in_mirror_zone.connect(mirror_zone)	
	_global_datas.vertex_hit_effect.connect(fade_decor)
	

func mirror_zone():
	
	var player_state = _global_datas.player_state
	 
	if player_state == game_state.visible_state.normal:
		mirror_view.visible = false
		RenderingServer.global_shader_parameter_set("isGray", 0.0)
		fade_decor()
	if player_state == game_state.visible_state.mirror:
		mirror_view.visible = true
		RenderingServer.global_shader_parameter_set("isGray", 1.0)	
		fade_decor()	
		
func fade_decor():
			
	if f:
		f.kill()
	f = create_tween()
	f.tween_method(_value,0.05,0.0,0.5)	


func _value(value : float):
	
	RenderingServer.global_shader_parameter_set("mirror_wave_speed", value)	
