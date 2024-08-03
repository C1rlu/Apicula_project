extends _back_call
class_name _on_focus

@export var back_call_state : boardCamState_data

func back_call()-> void:
	#put back call effet here
	
	_global_datas._add_back_call.emit(set_back_call)	
	
	
func set_back_call():
	_global_datas.camera_focus_On.emit(back_call_state)

