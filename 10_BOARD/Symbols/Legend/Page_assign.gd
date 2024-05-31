extends Node3D

@export var _book_data : book_page_data
@export var page_index : int = 0

signal update_legend 

func _on_show_this_page_show_this_page():
	
	_book_data.book_node._show_from_index(page_index)
	var book_position = _book_data.book_node.position
	_global_datas.focus_this_on_board.emit(book_position)		

