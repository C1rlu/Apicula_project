extends Node

@export var orbe_spawner_tool : tool_data
@export var scanner_spawner_tool : tool_data


#@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"

var cancel_action = false

var is_tracing : bool = false

func _ready():
	orbe_spawner_tool.tool_active_signal.connect(spawn_orbe)	
	orbe_spawner_tool.cancel_action_signal.connect(_cancel_action)
	
	scanner_spawner_tool.tool_active_signal.connect(stop_tracing)
	
	
	_global_datas._photo_flash.connect(_cancel_action)
	
	
func stop_tracing(condition : bool):
	_cancel_action()	
		
func spawn_orbe(condition : bool):

	
	
	if condition:
		cancel_action = false
		if !is_tracing:
			_global_datas._instance_start_visual_orbe.emit()
			#vfx_sphere_mirror.emitting = true
			is_tracing = true
		else :
			_global_datas._instance_end_visual_orbe.emit()		
		_global_datas._strokeID += 1
		is_tracing = true	
			
	#else :
		#if !cancel_action:
			#_global_datas._instance_end_visual_orbe.emit()
			
		
		
func _cancel_action():
	
	is_tracing = false
	cancel_action = true	
	#vfx_sphere_mirror.emitting = false
