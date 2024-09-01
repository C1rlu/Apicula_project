extends Node

@export var Scannable : Node
@export var element : Array[MeshInstance3D]

var lat_next_pass : Array
var fade_out

func _ready():
	
	Scannable.fade.connect(_fade_out)
	
	
	for e in element:
		var _mat = e.get_surface_override_material(0)
		var _mat_next = _mat.get_next_pass()
		lat_next_pass.append(_mat_next)
		

		
func _fade_out():
		
		if fade_out:
			fade_out.kill()
		
		fade_out = create_tween()
		fade_out.tween_method(set_shader_value,1.0,0.0,1.0)
		
	
func set_shader_value(value):

	
	for m in lat_next_pass:
		m.set_shader_parameter("Opacity",value)


