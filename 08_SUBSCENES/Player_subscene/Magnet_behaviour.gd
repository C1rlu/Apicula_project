extends Node


@export var magnet_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"


func _ready():
	magnet_tool.tool_active_signal.connect(active)	
	magnet_tool.cancel_action_signal.connect(disable)	
	

func active(condition):
	vfx_sphere_mirror.emitting = condition
	
func disable():
	vfx_sphere_mirror.emitting = false			
