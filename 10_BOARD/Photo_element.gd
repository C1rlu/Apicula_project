extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData
@export var next_photo_data_question : Array[Node3D]

@export var _question_link : Array[MeshInstance3D]

@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0
@onready var legend = $legend
@onready var photo = $Photo

@onready var collision_shape_3d_l = $legend/Legend_area/CollisionShape3D

signal update_legend( legend : String)

@onready var on_over_full = $legend/All_over/On_Over_full
@export var camera_state : boardCamState_data
func _ready():
	
	Photo_data.photo_element = self
		
func check_state():
		
	_disable()	
	
	if Photo_data.intrige_state == 1: 
		show_interogation()
	
	if Photo_data.intrige_state == 2:
		show_all_info()	 
		show_interogation()
	
func show_interogation():
	legend.visible = true
	collision_shape_3d_l.disabled = false		
	
	for node in _question_link:
		node.visible = true
	

func show_all_info():
	
	#active photo on board
	photo.visible = true	

	on_over_full.visible = true	

	# update legend:
	update_legend.emit(Photo_data.legend)
	
	for p in next_photo_data_question:
		if p.Photo_data.intrige_state == 0:
			p.Photo_data.intrige_state = 1
	
		
		
func _disable():
	
	for node in _question_link:
		node.visible = false
	
	
	legend.visible = false	
	photo.visible = false
	
	on_over_full.visible = false
	
	collision_shape_3d_l.disabled = true	


func show_this_on_book():
	

	_global_datas.show_page.emit(Photo_data.page_prefab)

	var book = _global_datas.book_data.book_node
	book.position = photo_element_root.global_position  + book_position_offset
	var rotation_offset = book_rotation_angle - book.position.x * 25
	book.rotation_degrees = Vector3(0,rotation_offset,0)
	
	var target = book.global_position

	_global_datas.focus_this_on_board.emit(target)
	_global_datas.camera_focus_On.emit(camera_state)
	
	
	_global_datas.book_idle_pos = false		
	_global_datas.book_back_idle_position.emit(true)
	
	
func _on_show_this_page():

	show_this_on_book()	

		

