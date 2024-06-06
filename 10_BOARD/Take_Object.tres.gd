extends Node

@onready var root = $".."
var photo_data : PhotoData
var _book_data : book_page_data
var page_index : int


signal on_click(condition : bool)

func _ready():
	page_index = root.page_index
	photo_data =  root.photo_data
	_book_data = root.book_data


func _on_on_click(condition):
	
	if condition:
		_global_datas.selected_photoData = photo_data
		_book_data.book_node._show_from_index(page_index)
		print("open book")
