extends Node3D

@export var page_index : int = 0


func _on_signet_go_page_show_this_page():
	var book = _global_datas.book_data
	book.book_node._show_from_index(page_index)

