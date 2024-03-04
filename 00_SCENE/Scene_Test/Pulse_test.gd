extends Node
@onready var z_depth_circle_buffer = $"../zDepth_circle_buffer"

@onready var SHADER: ShaderMaterial = z_depth_circle_buffer.get_active_material(0)

@onready var cam_pulse_render = $"../../../CAM_PULSE_RENDER"
@onready var timer = $"../start_vortex"
@onready var pulse_sphere_root = $"../../../../Pulse_sphere_SCALE"
@onready var pulse_sphere_area : Area3D = $"../../../../Pulse_sphere_SCALE/Pulse_sphere"

var vortex_position 
var t 

func _ready():
	
	_global_datas._mirror_switch.connect(start_vortex)
	_global_datas._backFrom_subscene.connect(disable)
	
func start_vortex(condition : bool):
	
		if condition:
			timer.start()
			vortex_position = _global_datas.Mirror_vortex_Node.get_global_transform()
			_global_datas.Mirror_vortex_Node.get_node_or_null("Mirror")._remove_mirror()
		else:
			active_zone(false)	
			
func active_zone(condition : bool):
	
	SHADER.set_shader_parameter("radius", 0.0)
	SHADER.set_shader_parameter("start_point", vortex_position)
	var offset = Vector3(0.0,0.0,-0.288)
	
	pulse_sphere_area.set_deferred("monitoring",condition)
	
	if condition:
		pulse_sphere_root.global_position = vortex_position.origin + offset 
		

	if t:
		t.kill()
		
	if condition:
		t = create_tween()
		t.tween_method(change_value,0.1,8.0,60)		
		
	z_depth_circle_buffer.visible = condition
	cam_pulse_render.visible = condition

	
func change_value(value : float):
	
	SHADER.set_shader_parameter("radius", value)

	pulse_sphere_root.scale = Vector3(value/2,value/2,value/2)

func disable():
	
	timer.stop()
	SHADER.set_shader_parameter("radius", 0.0)

	pulse_sphere_root.scale = Vector3(0.1,0.1,0.1)
	pulse_sphere_area.set_deferred("monitoring",false)
	
	if t:
		t.kill()
		
	z_depth_circle_buffer.visible = false
	cam_pulse_render.visible = false
	

func _on_start_vortex_timeout():
	active_zone(true)