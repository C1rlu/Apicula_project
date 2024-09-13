extends Node

@export var sun_root : Control

func _ready():
	_global_datas._up_time_state.connect(_up_time)
	_global_datas._backFrom_subscene.connect(_up_time)
	_reset_time()
	
	
func _up_time():
	
	
	if _global_datas._time_state > game_state.time_state.night:
		
		return
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state += 3
	update_sun_angle()
	
func _reset_time():
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state = 0
			


func update_sun_angle():
	var  time_value = clamp(0.0, 6.0, _global_datas._time_state)
	var sun_value = lerp(0,104,time_value / 6.0)

	sun_root.rotation_degrees = sun_value
