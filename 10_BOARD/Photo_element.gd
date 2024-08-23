extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData

@export var camera_state : boardCamState_data
@export var camera_state_focus : boardCamState_data

@export var _On_View: Node
@export var _On_Over: Node
@export var on_over_node : Node3D


func _ready():

	_On_View.On_View.connect(focus_or_scanner)
	_On_Over.On_Over.connect(On_Over)
	
	
func On_Over():
	_global_datas.show_element_info.emit(true,Photo_data.info)		
		

func focus_or_scanner():
	

	if !Photo_data.scanner_prefab:
		var focus_target = photo_element_root.global_position
		_global_datas.focus_this_on_board.emit(focus_target)
		_global_datas.camera_focus_On.emit(camera_state)
	else:
		_global_datas.selected_photoData = Photo_data
		_global_datas.focus_this_on_board.emit(_global_datas.scanner_root.global_position)
		_global_datas.camera_focus_On.emit(camera_state_focus)
		_global_datas.show_on_scanner.emit(true)	
		
	

	_global_datas.show_element_info.emit(true,Photo_data.info)		

