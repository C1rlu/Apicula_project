extends Node

@onready var timer = $Timer
@export var flash_tool_data : tool_data

func _ready():
	pass	
	#flash_tool_data.tool_active_signal.connect(_start_light)	


func _start_light(condition):
	
	if _global_datas.in_scanner_mode:
		return
	
	if !condition:
		return
		
	if !timer.is_stopped():
		return
	if _global_datas.scanner_flash_isActive:
		return
			
	timer.start()

	_global_datas._photo_flash.emit()
	_global_datas.flash_x_ray_oddity.emit()	
	
