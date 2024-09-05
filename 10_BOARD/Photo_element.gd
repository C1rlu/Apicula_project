extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData

@export var camera_state : boardCamState_data
@export var camera_state_focus : boardCamState_data

@export var _On_View: Node
@export var _On_Over: Node
@export var on_over_node : Node3D
@onready var label = $SubViewport/Label


func _ready():

	_On_View.On_View.connect(focus_or_scanner)
	_On_Over.On_Over.connect(On_Over)
	label.text = Photo_data.legend
	
func On_Over():
	_global_datas.show_element_info.emit(true,Photo_data.info)		
		

func focus_or_scanner():
	
	
	var focus_target = photo_element_root.global_position
	_global_datas.focus_this_on_board.emit(focus_target)
	_global_datas.camera_focus_On.emit(camera_state)
	_global_datas.show_element_info.emit(true,Photo_data.info)		
