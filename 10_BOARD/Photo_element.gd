extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData

@export var camera_state : boardCamState_data

@export var _On_View: Node
@export var _On_Over: Node
@export var on_over_node : Node3D

func _ready():

	_On_View.On_View.connect(show_this_on_book)
	_On_Over.On_Over.connect(On_Over)
	
func On_Over():
	_global_datas.show_element_info.emit(true,Photo_data.info)		
		
	
func show_this_on_book():
	
	# let's avoid the page book for the moment and add just camera state focus
	#_global_datas.open_3d_book.emit(true)
	#_global_datas.show_page.emit(Photo_data.page_prefab)
	
	#var book = _global_datas.book_data.book_node
	#book.position = photo_element_root.global_position  + book_position_offset
	#var rotation_offset = book_rotation_angle - book.position.x * 25
	#book.rotation_degrees = Vector3(0,rotation_offset,0)
	#
	#var target = book.global_position
	
	var focus_target = photo_element_root.global_position
	_global_datas.focus_this_on_board.emit(focus_target)
	_global_datas.camera_focus_On.emit(camera_state)
	
	
	#_global_datas.book_idle_pos = false		
	

		

