extends Node

@onready var teleporter_prefab = $".."


@onready var explose_part = $"../Explose_part"
@onready var vortex_part = $"../Vortex_part"
@onready var msh = $"../Msh"
@onready var mesh_mat : Material = msh.get_surface_override_material(0)


var t
var f

func scale_effect():
	
	if t:
		t.kill()
	t = create_tween()	
	t.tween_method(_value,1.0,0.5,0.5).set_trans(Tween.TRANS_SINE)
	
	if f:
		f.kill()
	f = create_tween()
	f.tween_method(_f_value,0.25,0.02,0.5)
	
func _value(value : float):

	vortex_part.amount_ratio = value
	mesh_mat.set_shader_parameter("Speed",value)

func _f_value(value : float):
	
	RenderingServer.global_shader_parameter_set("mirror_wave_speed", value)	
	
func _on_teleporter_teleport_effect():
	explose_part.emitting = true
	scale_effect()


func _player_in():
	scale_effect()
