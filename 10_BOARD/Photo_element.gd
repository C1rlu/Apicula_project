extends Node3D

@onready var photo_element_root = $"."

@export var Photo_data : PhotoData

@export var links_list : Array[Node3D]
@export var next_photo_data : Array[Node3D]


@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0
@onready var legend = $legend
@onready var photo = $Photo
@onready var collision_shape_3d_p = $Photo/Photo_area/CollisionShape3D
@onready var collision_shape_3d_l = $legend/Legend_area/CollisionShape3D

signal update_legend( legend : String)
func _ready():
	_active()		
func _active():	
	check_state()

		
func check_state():
		
	_disable()	
	
	if Photo_data.board_information_state == 0:
		return
		
	if Photo_data.board_information_state == 1:
		show_interogation()		
		return	
				
	if Photo_data.board_information_state == 2:
		show_interogation()
		show_all_info()	
		return			
	
func show_interogation():
	legend.visible = true
	collision_shape_3d_l.disabled = false		

func show_all_info():
	
	#active photo on board
	photo.visible = true	
	collision_shape_3d_p.disabled = false
		
	#active next ? of the intrigue
	for p in next_photo_data:    
		if p.Photo_data.board_information_state == 0:
			p.Photo_data.board_information_state = 1
			p.Photo_data.page_information_state = 1
	for l in links_list:
		l.visible = true		
		
	# update legend:
	update_legend.emit(Photo_data.legend)
	
func _disable():
	
	legend.visible = false	
	photo.visible = false
	collision_shape_3d_p.disabled = true	
	collision_shape_3d_l.disabled = true	
	
	for l in links_list:
			l.visible = false	
	

func show_this_on_book():
	
	_global_datas.selected_photoData = Photo_data
	_global_datas.book_data.book_node._show_from_index(Photo_data.page_index)
	
	var book = _global_datas.book_data.book_node
	#book.position = photo_element_root.global_position  + book_position_offset
	#var rotation_offset = book_rotation_angle - book.position.x * 25
	#book.rotation_degrees = Vector3(0,rotation_offset,0)
	var offset = Vector3(-0.02,0.0,-0.07)
	
	var book_position = book.position + offset
	_global_datas.focus_this_on_board.emit(book_position)		
	_global_datas.book_idle_pos = false		
	_global_datas.book_back_idle_position.emit(true)
	
	
func _on_show_this_page():

	show_this_on_book()	
	_global_datas._add_back_call.emit(back_call)
	
func back_call():
		_global_datas.book_back_idle_position.emit(false)	
		
func _on_show_scanner():
	if _global_datas.link_mode:
		return
	_global_datas.selected_photoData = Photo_data
	_global_datas.show_on_scanner.emit(true)

