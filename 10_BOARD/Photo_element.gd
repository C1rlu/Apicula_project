extends Node3D

@onready var photo_element_root = $"."
@export var Photo_data : PhotoData
@export var next_photo_data_question : Array[Node3D]

@export var _question_link : Array[MeshInstance3D]

@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0
@onready var legend = $legend
@onready var photo = $Photo
@onready var collision_shape_3d_p = $Photo/Photo_area/CollisionShape3D
@onready var collision_shape_3d_l = $legend/Legend_area/CollisionShape3D

signal update_legend( legend : String)



		
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
	collision_shape_3d_p.disabled = false
		

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
	collision_shape_3d_p.disabled = true	
	collision_shape_3d_l.disabled = true	


func show_this_on_book():
	
	_global_datas.selected_photoData = Photo_data
	

	#var book = _global_datas.book_data.book_node
	#book.position = photo_element_root.global_position  + book_position_offset
	#var rotation_offset = book_rotation_angle - book.position.x * 25
	#book.rotation_degrees = Vector3(0,rotation_offset,0)
	
	#var offset = Vector3(-0.02,0.0,-0.07)
	#var book_position = book.position + offset
	#_global_datas.focus_this_on_board.emit(book_position)	
		
	_global_datas.book_idle_pos = false		
	_global_datas.open_info_book.emit(true)
	
	_global_datas.show_page.emit(Photo_data.page_prefab)
	
func _on_show_this_page():

	show_this_on_book()	
	_global_datas._add_back_call.emit(back_call)
	
func back_call():
		_global_datas.open_info_book.emit(false)	
		
func _on_show_scanner():

	_global_datas.selected_photoData = Photo_data
	_global_datas.show_on_scanner.emit(true)
