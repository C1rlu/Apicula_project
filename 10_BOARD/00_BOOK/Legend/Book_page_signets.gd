extends Node3D

@export var page_index : int = 0

func _on_on_click_on_click():
	var book = _global_datas.book_data
	book.book_node._show_from_index(page_index)
