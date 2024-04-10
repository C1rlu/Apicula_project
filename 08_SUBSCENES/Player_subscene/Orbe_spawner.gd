extends Node

@export var orbe_spawner_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"

var cancel_action = false

func _ready():
	orbe_spawner_tool.tool_active_signal.connect(spawn_orbe)	
	orbe_spawner_tool.cancel_action_signal.connect(_cancel_action)
	
func spawn_orbe(condition : bool):

	vfx_sphere_mirror.emitting = condition

	if condition:
		cancel_action = false
		_global_datas._instance_start_visual_orbe.emit()
		_global_datas._strokeID += 1	
		
	else :
		if !cancel_action:
			_global_datas._instance_end_visual_orbe.emit()
			
		
		
func _cancel_action():
	
	cancel_action = true	
	vfx_sphere_mirror.emitting = false
