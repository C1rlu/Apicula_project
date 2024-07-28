extends Node

@export var main_focus : boardCamState_data


func _ready():
	_global_datas.select_boardFocus.connect(select_focus)
	
func select_focus(focus_data : boardCamState_data):
	print(focus_data)
	var position_target = focus_data.camera_position_node.position
	var rotation_target = focus_data.camera_position_node.rotation_degrees		
	_global_datas.camera_board_state.emit(position_target,rotation_target)
	
	
	add_back_call()
	
	
func add_back_call():
	
	_global_datas._add_back_call.emit(back_call)
	
func back_call():
	select_focus(main_focus)		
