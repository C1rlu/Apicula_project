extends Node
@onready var meduse_species_prefab = $".."

@export var mesh : MeshInstance3D
var mesh_mat : Material


var t
var actual_value : float

var _is_active : bool

signal fusion_result

func _ready():
	if mesh:
		mesh_mat = mesh.get_surface_override_material(0)		
	
func _fusion(condition):
	#print("FUSION ME ",condition)

	if condition:
		if !_is_active:
			var r_time = randf_range(0.5,1.0)
			if t:
				t.kill()
			t = create_tween()
			t.tween_method(_change_value,0.25,1.0,r_time)
			t.connect("finished",_done)
			_is_active = true
	else:
		if t:
			t.kill()
		var r_time = randf_range(0.5,1.0)
		t = create_tween()
		t.tween_method(_change_value,actual_value,0.25,r_time)	
		_is_active = false
		
func _done():
	fusion_result.emit()
	meduse_species_prefab.queue_free()	
				
func _change_value(value):
	if mesh_mat:
		mesh_mat.set_shader_parameter("Speed",value)	
	actual_value = value
