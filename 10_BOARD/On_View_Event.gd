extends Node

@export var info : info_data

@export var focus_data : boardCamState_data
@export var On_View : Node
@export var On_Over : Node
func _ready():
	On_View.On_View.connect(_focus)
	On_Over.On_Over.connect(_on_over)
func _focus():
	#let see with a state
	pass
	#_global_datas.camera_focus_On.emit(focus_data)
	
func _on_over():
	_global_datas.show_element_info.emit(true,info)
