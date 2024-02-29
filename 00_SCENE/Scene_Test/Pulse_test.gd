extends Node
@onready var z_depth_circle_buffer = $"../zDepth_circle_buffer"

@onready var SHADER: ShaderMaterial = z_depth_circle_buffer.get_active_material(0)

@export_node_path("Node3D") var origin_point
@onready var cam_pulse_render = $"../../../CAM_PULSE_RENDER"

var t 

func _ready():
	
	_global_datas.active_mirror_switch.connect(active_zone)
	
func active_zone(condition : bool):
	
	SHADER.set_shader_parameter("start_point", get_node(origin_point).get_global_transform())

	if t:
		t.kill()
		
	if condition:
		t = create_tween()
		t.tween_method(change_value,8.0,0.0,60)		
	z_depth_circle_buffer.visible = condition
	cam_pulse_render.visible = condition
	
func change_value(value : float):
	
	SHADER.set_shader_parameter("radius", value)
	
