extends Node

@export var focus_data : boardCamState_data

@export var On_View : Node

func _ready():
	if On_View :
		On_View.On_View.connect(on_click)


func on_click():
	if focus_data:
		
		if _global_datas.camera_current_state == focus_data.cam_state:
			return
		_global_datas.camera_focus_On.emit(focus_data)
		_global_datas.show_on_scanner.emit(true)
	
