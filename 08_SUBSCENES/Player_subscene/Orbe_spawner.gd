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
		
		var target = _global_datas._orbe_tool_origin_position
		_global_datas._start_point = target
		_global_datas._instance_visual_Orbe.emit()
		#_global_datas._instance_stroke.emit()	
		
		#timer_orber.start()
		#timer_stroke.start()
		_global_datas._strokeID += 1	
		
	else :
		
		var target = _global_datas._orbe_tool_origin_position
		_global_datas._end_point = target
		_global_datas._instance_visual_Orbe.emit()
		
		_global_datas._instance_stroke.emit()	
		
		pass
		#timer_stroke.stop()		
		#timer_orber.stop()
		

#func _on_timer_stroke_timeout():
	#_global_datas._instance_stroke.emit()


#func _on_timer_orber_timeout():
	#_global_datas._instance_visual_Orbe.emit()
