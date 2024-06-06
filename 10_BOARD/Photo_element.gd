extends Node3D


@export var Photo_data : PhotoData

@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0

@onready var legend = $legend
@onready var photo = $Photo
@onready var collision_shape_3d_p = $Photo/Photo_area/CollisionShape3D
@onready var collision_shape_3d_l = $legend/Legend_area/CollisionShape3D

func _ready():
	_disable()	
	
	
func _active():
	
	legend.visible = true	
	photo.visible = true	
	collision_shape_3d_p.disabled = false	
	collision_shape_3d_l.disabled = false
	
	
func _disable():
	
	legend.visible = false	
	photo.visible = false
	collision_shape_3d_p.disabled = true	
	collision_shape_3d_l.disabled = true	
	
func show_this_on_book():
	
	_global_datas.selected_photoData = Photo_data

	_global_datas.book_data.book_node._show_from_index(Photo_data.page_index)
	var book = _global_datas.book_data.book_node
	book.position = global_position + book_position_offset
	var real_offset = book_rotation_angle + (-position.x * 40)
	book.rotation_degrees = Vector3(0.0,real_offset,0.0)
			
	var offset = Vector3(-0.02,0.0,-0.05)
	var book_position = book.position + offset
	_global_datas.focus_this_on_board.emit(book_position)		
	_global_datas.book_fade_in.emit()
	_global_datas.book_idle_pos = false		


func _on_show_this_page_show_this_page():
	show_this_on_book()	


func _on_show_scanner_show_scanner():
	_global_datas.selected_photoData = Photo_data
	
	_global_datas.show_on_scanner.emit(true)
