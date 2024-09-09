extends Node

@export var root : Node3D
@export var info : info_data

@export var focus_data : boardCamState_data
@export var On_View : Node
@export var On_Over : Node

var element : element_data

func _ready():
	On_View.On_View.connect(_focus)
	
	if On_Over:
		On_Over.On_Over.connect(_on_over)
		
func _focus():
	

	#_global_datas._open_boad_Focus.emit(true,element)
	var focus_target = root.global_position
	_global_datas.focus_this_on_board.emit(focus_target)
	_global_datas.camera_focus_On.emit(focus_data)
	_global_datas.show_element_info.emit(true,info)
	
func _on_over(condition : bool):
	#_global_datas.show_element_info.emit(true,info)
	if element:
		_global_datas._show_object_legend.emit(condition,element.element_name)
