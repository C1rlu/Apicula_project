extends Node
@onready var root = $".."
@export var mesh : MeshInstance3D
@export var fusion_effect_range : Vector2
var mesh_mat : Material


var t
var actual_value : float

@export var can_be_fusion : bool = true
var _is_active : bool

signal fusion_result

func _ready():
	if mesh:
		mesh_mat = mesh.get_surface_override_material(0)		
	
func _fusion(condition):
	#print("FUSION ME ",condition)

	if !can_be_fusion:
		return
	if !is_inside_tree():
		return
	
	if condition:
		if !_is_active:
			var r_time = randf_range(0.5,1.0)
			if t:
				t.kill()
			t = create_tween()
			t.tween_method(_change_value,fusion_effect_range.x,fusion_effect_range.y,r_time)
			t.connect("finished",_done)
			_is_active = true
	else:
		if t:
			t.kill()
		var r_time = randf_range(0.5,1.0)
		t = create_tween()
		t.tween_method(_change_value,actual_value,fusion_effect_range.x,r_time)	
		_is_active = false


func _stop_fusion():
	
	if t:
		t.kill()
	var r_time = randf_range(0.5,1.0)
	t = create_tween()
	t.tween_method(_change_value,actual_value,0.0,r_time)	
	_is_active = false			
	
func _done():
	fusion_result.emit()
	
func _change_value(value):
	if mesh_mat:
		mesh_mat.set_shader_parameter("Speed",value)	
	actual_value = value



