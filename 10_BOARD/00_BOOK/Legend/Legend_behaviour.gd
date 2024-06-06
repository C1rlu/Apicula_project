extends Node

@onready var photo_element_root = $"../.."

@onready var text = $"../legend_render/text"
@onready var text_for_size = $"../legend_render/text_for_size"


func _ready():
	_global_datas.open_inventory.connect(_legend_ini)

func _legend_ini(condition):	
	
	var index = photo_element_root.Photo_data.page_index 
	var book = _global_datas.book_data
	
	if !book.book_pages[index].page_is_solved:
		return	
	var selected_legend = book.book_pages[index].book_page_title 	
	text.text = selected_legend
	text_for_size.text = selected_legend
	
