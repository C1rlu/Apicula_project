extends Node

@export var dive_points : Array[ColorRect]
@onready var back_time = $"../Back_time"

func _ready():
	_global_datas._up_time_state.connect(_up_time)
	_global_datas._go_Subscene.connect(_up_time)
	_global_datas._time_state = 3
	
func _up_time():
	
	_global_datas._time_state -= 1
	
	if _global_datas._time_state <= 0:
		_global_datas._time_state = 0
		_update_dive_amount()
		back_time.visible = true
		_global_datas._set_night.emit()
		return

	_update_dive_amount()
	

func _update_dive_amount():
	for d in dive_points:
		d.visible = false
	
	for i in range(_global_datas._time_state):
		dive_points[i].visible = true	
		
