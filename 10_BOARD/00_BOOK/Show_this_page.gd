extends Node

@onready var root = $".."
@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0


signal on_click(condition : bool)

signal show_this_page

func _on_on_click(condition):
	
	if condition:
		show_this_page.emit()
		_global_datas.selected_photoData = $"..".photo_data
		
		show_this_on_book()
		
func show_this_on_book():
	
	_global_datas.book_data.book_node._show_from_index($"..".photo_data.page_index)
	var book = _global_datas.book_data.book_node
	book.position = root.global_position + book_position_offset
	var real_offset = book_rotation_angle + (-root.position.x*40)
	book.rotation_degrees = Vector3(0.0,real_offset,0.0)
			
	var offset = Vector3(-0.02,0.0,-0.05)
	var book_position = book.position + offset
	_global_datas.focus_this_on_board.emit(book_position)		
	_global_datas.book_fade_in.emit()
	_global_datas.book_idle_pos = false		


func _on_show_this_page():
	pass # Replace with function body.
