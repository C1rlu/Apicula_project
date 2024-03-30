extends Node

@export var orbe_spawner_tool : tool_data
@onready var vfx_sphere_mirror = $"../VFX_SPHERE_MIRROR"

@onready var timer = $Timer

func _ready():
	orbe_spawner_tool.tool_active_signal.connect(spawn_orbe)	
	
func spawn_orbe(condition : bool):

	vfx_sphere_mirror.emitting = condition
	
	if condition:
		_global_datas._instance_stroke.emit()	
		timer.start()
		_global_datas._strokeID += 1	
	else :
		timer.stop()		

func done():
	
	_global_datas._instance_stroke.emit()


func _on_timer_timeout():
	done()
