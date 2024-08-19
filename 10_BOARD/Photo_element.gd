extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData
@export var next_photo_data_question : Array[Node3D]

@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0

@onready var legend = $legend
@onready var photo = $Photo


signal update_legend( legend : String)

@onready var on_over_full = $legend/All_over/On_Over_full
@export var camera_state : boardCamState_data

@export var On_over : Node
@export var On_View: Node
func _ready():
	
	Photo_data.photo_element = self
	if On_over:
		On_over._photo_data = Photo_data

	update_legend.emit(Photo_data.legend)
	On_View.On_View.connect(show_this_on_book)
	
	
	
func show_this_on_book():
	
	_global_datas.open_3d_book.emit(true)
	_global_datas.show_page.emit(Photo_data.page_prefab)
	
	#var book = _global_datas.book_data.book_node
	#book.position = photo_element_root.global_position  + book_position_offset
	#var rotation_offset = book_rotation_angle - book.position.x * 25
	#book.rotation_degrees = Vector3(0,rotation_offset,0)
	#
	#var target = book.global_position
#
	#_global_datas.focus_this_on_board.emit(target)
	#_global_datas.camera_focus_On.emit(camera_state)
	
	
	#_global_datas.book_idle_pos = false		
	


	
	
func _on_show_this_page():
	show_this_on_book()	

		

