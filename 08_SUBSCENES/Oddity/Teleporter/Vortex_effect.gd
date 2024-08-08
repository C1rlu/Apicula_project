extends Node

@onready var teleporter_prefab = $".."


@onready var explose_part = $"../Explose_part"
@onready var vortex_part = $"../Vortex_part"
@onready var msh = $"../Msh"
@onready var mesh_mat : Material = msh.get_surface_override_material(0)


var t

func scale_effect():
	
	if t:
		t.kill()
	t = create_tween()	
	t.tween_method(_value,1.0,0.5,0.5).set_trans(Tween.TRANS_SINE)
	#t.connect("finished",back_sacle)

func back_sacle():
	
	t = create_tween()
	if t:
		t.kill()
		t = create_tween()
		t.tween_method(_value,1.0,0.5,0.5).set_trans(Tween.TRANS_SINE)
		
func _value(value : float):
	#teleporter_prefab.scale = Vector3(value,value,value)
	vortex_part.amount_ratio = value
	mesh_mat.set_shader_parameter("Speed",value)


func _on_teleporter_teleport_effect():
	explose_part.emitting = true
	scale_effect()
