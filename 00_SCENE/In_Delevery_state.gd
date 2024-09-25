extends Node


@export var delevery_ui_node : Node3D

func _ready():
	_global_datas._in_delevery_zone.connect(_in_delevery_zone)
	
	
	
func _in_delevery_zone(condition : bool):
	
	if _global_datas._time_state != 0:
		if condition:
			_global_datas._show_object_legend.emit(true,"delevery post open the evening, come back later")
		else:
			_global_datas._show_object_legend.emit(false,"null")
		return
	delevery_ui_node.visible = condition
	

func _input(event):
	
	
	if _global_datas.Player_InDialogue:
		return
	if _global_datas.Player_InSubScene:
		return	
		
	if _global_datas.Player_InMenu:
		return	
		
	if delevery_ui_node.visible:
		if event.is_action_pressed("Click"):
			_global_datas._in_delivery_mode.emit(true)	
