extends Node

@onready var _timer = $Next_call

var call_index : int = 0

func _ready():
	_global_datas.flash_x_ray_oddity.connect(call_scanner)
	
	
func call_scanner():
	
	if !_timer.is_stopped():
		return	
	
	if _global_datas.scanner_element_list.size() > 0:
		call_index = 0
		_check_scanner_order()
		_global_datas.scanner_flash_isActive = true
		
func _check_scanner_order():

	if _global_datas.scanner_element_list.size() > call_index:
		_timer.start()
		_global_datas.scanner_element_list[call_index].active_flash()
		_global_datas._scan_mirror_xray.emit() # here for visual scanner world
	else:
		_timer.stop()	
		_global_datas.scanner_flash_isActive = false	
			
func _on_next_call_timeout():
	call_index += 1
	#_timer.wait_time = randf_range(0.5,1.0)
	_check_scanner_order()	
