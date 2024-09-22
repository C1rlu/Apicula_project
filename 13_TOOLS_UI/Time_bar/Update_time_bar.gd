extends Node

@export var index_label : Label


func _ready():
	_global_datas._up_time_state.connect(_up_time)
	_global_datas._go_Subscene.connect(_up_time)
	_global_datas._time_state = 3
	
func _up_time():
	
	_global_datas._time_state -= 1
	
	if _global_datas._time_state <= 0:
		_global_datas._time_state = 0
		_update_dive_amount()

		_global_datas._set_night.emit()
		return

	_update_dive_amount()
	

func _update_dive_amount():
	index_label.text = str(_global_datas._time_state )
