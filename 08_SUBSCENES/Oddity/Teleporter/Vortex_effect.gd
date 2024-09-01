extends Node

#@onready var teleporter_prefab = $".."
#@onready var explose_part = $"../Explose_part"
#
#@onready var msh = $"../Msh"
#@onready var mesh_mat : Material = msh.get_surface_override_material(0)


#var t
#
#
#func scale_effect():
	#
	#if t:
		#t.kill()
	#t = create_tween()	
	#t.tween_method(_value,2.0,0.5,0.5).set_trans(Tween.TRANS_SINE)
	#
#
#func _value(value : float):
	#
	#mesh_mat.set_shader_parameter("Speed",value)
#
#
#func _on_teleporter_teleport_effect():
	#explose_part.emitting = true
	#scale_effect()
#
#
#func _player_in():
	#scale_effect()
