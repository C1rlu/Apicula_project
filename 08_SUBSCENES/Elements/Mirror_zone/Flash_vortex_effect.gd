extends Node

@onready var render_vortex_globe_effect = $"../Mirror_prefabs/Render_vortex_globe_effect"
@onready var render_vortex = $"../Mirror_prefabs/Render_vortex"
@onready var render_vortex_mat : Material = render_vortex.get_surface_override_material(0)
var t 

var player_inside : bool = false

func _ready():
	
	_global_datas._photo_flash.connect(_flash_vortex)	


func _flash_vortex():

	if player_inside:
		return
		
	render_vortex_mat.set_shader_parameter("Speed",1.0)
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(scale_value,1.0,1.1,0.05)	
	t.connect("finished",out)	
	
func out():
	
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(scale_value,1.1,1.0,0.5)	
	render_vortex_mat.set_shader_parameter("Speed",0.5)
								
func scale_value(value : float):
	render_vortex_globe_effect.scale = Vector3(value,value,value)	
	render_vortex.scale = Vector3(value,value,value)	
	


func _on_p_layer_in_zone_player_in(condition):
	player_inside = condition
