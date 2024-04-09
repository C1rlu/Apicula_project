extends Node

@export var orbe_spawner_tool : tool_data
@onready var vfx_sphere_mirror = $"../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"


@onready var timer_stroke = $Timer_stroke
@onready var timer_orber = $Timer_Orber

func _ready():
	orbe_spawner_tool.tool_active_signal.connect(spawn_orbe)	
	
func spawn_orbe(condition : bool):

	vfx_sphere_mirror.emitting = condition

	if condition:
		
		_global_datas._instance_start_visual_orbe.emit()
		_global_datas._strokeID += 1	
		
	else :
		_global_datas._instance_end_visual_orbe.emit()
			

		


