extends Node

@export var Zone_attributor : Control
func _ready():
	_global_datas._open_zone_attributions.connect(_select_zone)
	
	
	
func _select_zone(condition : bool):
	
	Zone_attributor.visible = condition
	
	if condition:
		#_global_datas._show_zone_info.emit(false)
		_global_datas._add_back_call.emit(back_call)
		
	_global_datas.Player_InMenu = condition
	
func back_call():
	
	_global_datas._open_zone_attributions.emit(false)
	#_global_datas._show_zone_info.emit(true)
