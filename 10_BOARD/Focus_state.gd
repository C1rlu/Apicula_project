extends Node



@export var focus_data : boardCamState_data


func _on_on_click_on_click():
	if focus_data:
		
		if _global_datas.camera_current_state == focus_data.cam_state:
			return
		_global_datas.camera_focus_On.emit(focus_data)
		
	
