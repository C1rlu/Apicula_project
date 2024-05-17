extends Node
@onready var meduse_species_prefab = $".."

@onready var medusa_mesh_01 = $"../Medusa_mesh_012/Medusa_mesh_01"
@onready var medusa_mesh_01_mat = medusa_mesh_01.get_surface_override_material(0)

var t
var actual_value : float

var _is_active : bool

func _fusion(condition):
	print("FUSION ME ",condition)

	
	
			
	if condition:
		if !_is_active:
			if t:
				t.kill()
			t = create_tween()
			t.tween_method(_change_value,0.25,1.0,0.5)
			t.connect("finished",_done)
			_is_active = true
	else:
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(_change_value,actual_value,0.25,0.5)	
		_is_active = false
		
func _done():
	meduse_species_prefab.queue_free()	
				
func _change_value(value):
	medusa_mesh_01_mat.set_shader_parameter("Speed",value)	
	actual_value = value
