extends Node



func _ready():
	_global_datas.select_boardFocus.connect(select_focus)
	
func select_focus(focus_data : boardCamState_data):

	var position_target = focus_data.p_position
	var rotation_target = focus_data.r_position	
	_global_datas.camera_board_state.emit(position_target,rotation_target)

