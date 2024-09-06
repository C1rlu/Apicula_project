extends _back_call
class_name _scanner_back_call

@export var back_call_state : boardCamState_data

func back_call()-> void:
	#put back call effet here
	
	_global_datas._add_back_call.emit(set_back_call)	
	
	
func set_back_call():
	_global_datas.camera_focus_On.emit(back_call_state)
	_global_datas.show_on_scanner_backdrop.emit(false)		
	_global_datas.show_on_scanner.emit(false)

