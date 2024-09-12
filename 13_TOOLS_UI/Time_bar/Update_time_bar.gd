extends Node


@export var Time_bar : HSlider


func _ready():
	_global_datas._up_time_state.connect(_up_time)
	_reset_time()


func _up_time():
	
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state += 1
	_update_bar()
	
	
	
func _reset_time():
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state = 0
			
func _update_bar():
	Time_bar.value = _global_datas._time_state
	
	
	
