extends Node

@onready var teleporter_prefab = $".."


@onready var explose_part = $"../Explose_part"
@onready var vortex_part = $"../Vortex_part"
@onready var msh = $"../Msh"
@onready var mesh_mat : Material = msh.get_surface_override_material(0)
@onready var timer = $"../Teleporter_timer/Timer"

var t

signal check_teleporter
signal atractor_strenght(strenght : float)

func scale_effect():
	
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_value,1.0,0.01,0.15).set_trans(Tween.TRANS_SINE)
	t.connect("finished",back_sacle)

func back_sacle():

	check_teleporter.emit()
	
	if t:
		t.kill()
		t = create_tween()
		t.tween_method(_value,0.01,1.0,timer.wait_time).set_trans(Tween.TRANS_SINE)
		
func _value(value : float):
	teleporter_prefab.scale = Vector3(value,value,value)
	vortex_part.amount_ratio = value
	mesh_mat.set_shader_parameter("Speed",value)
	atractor_strenght.emit(value)

func _on_teleporter_timer_teleport_effect():
	explose_part.emitting = true
	scale_effect()
