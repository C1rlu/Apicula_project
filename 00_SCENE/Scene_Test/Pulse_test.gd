extends Node
@onready var z_depth_circle_buffer = $"../zDepth_circle_buffer"

@onready var SHADER: ShaderMaterial = z_depth_circle_buffer.get_active_material(0)

@onready var cam_pulse_render = $"../../../CAM_PULSE_RENDER"
@onready var timer = $"../start_vortex"

var t 

func _ready():
	
	_global_datas.active_mirror_switch.connect(start_vortex)
	_global_datas._backFrom_subscene.connect(disable)
	
func start_vortex(condition : bool):
	
		if condition:
			timer.start()
			
		else:
			active_zone(false)	
			
func active_zone(condition : bool):
	
	SHADER.set_shader_parameter("radius", 0.0)
	SHADER.set_shader_parameter("start_point",_global_datas.Mirror_vortex_Node.get_global_transform())

	
	if t:
		t.kill()
		
	if condition:
		t = create_tween()
		t.tween_method(change_value,0.0,8.0,60)		
	z_depth_circle_buffer.visible = condition
	cam_pulse_render.visible = condition
	
func change_value(value : float):
	
	SHADER.set_shader_parameter("radius", value)
	

func disable():
	
	timer.stop()
	
	if t:
		t.kill()
	z_depth_circle_buffer.visible = false
	cam_pulse_render.visible = false
	
func _on_start_vortex_timeout():
	active_zone(true)
