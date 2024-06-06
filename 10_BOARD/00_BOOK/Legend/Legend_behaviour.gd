extends Node




@onready var text = $"../Text_render/text"
@onready var text_for_size = $"../Text_render/text_for_size"
@onready var legend_prefab = $".."


func _update_legend_ini(book_data,index):	
	
	var selected_legend = book_data.book_pages[index].book_page_title 	
	text.text = selected_legend
	text_for_size.text = selected_legend
	

	

func _on_legend_prefab_ini_legend(_book_data, index):
	_update_legend_ini(_book_data,index)	
