extends Node

@export var sun_root : Control
@export var _text : Label
func _ready():
	#_global_datas._up_time_state.connect(_up_time)
	#_global_datas._backFrom_subscene.connect(_up_time)
	_reset_time()
	update_sun_angle()
	
func _up_time():
	
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state += 2
	
	if _global_datas._time_state > game_state.time_state.night:
		@warning_ignore("int_as_enum_without_cast")
		_global_datas._time_state = 4
		update_sun_angle()
		return

	update_sun_angle()
	
func _reset_time():
	@warning_ignore("int_as_enum_without_cast")
	_global_datas._time_state = 0
			

func update_sun_angle():

	var _value = game_state.time_state.keys()[_global_datas._time_state]
	_text.text = str(_value)
				
