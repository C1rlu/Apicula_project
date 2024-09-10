extends Node3D

@export var Photo_data : PhotoData
@export var element : element_data
@onready var photo_element_root = $"."



@export var _On_View: Node
#@export var _On_Over: Node
@export var on_over_node : Node3D

func _ready():

	_On_View.On_View.connect(focus_or_scanner)
	#_On_Over.On_Over.connect(On_Over)
	element.photoData = Photo_data
#func On_Over():
	#_global_datas.show_element_info.emit(true,Photo_data.info)		
		#

func focus_or_scanner():
	
	
	#var focus_target = photo_element_root.global_position
	#_global_datas.focus_this_on_board.emit(focus_target)
	#_global_datas.camera_focus_On.emit(camera_state)
	#_global_datas.show_element_info.emit(true,Photo_data.info)	
	
	_global_datas._open_board_focus_2D.emit(true,element)
