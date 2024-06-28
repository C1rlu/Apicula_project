extends Node

@export var photo_data_first : PhotoData 

signal On_click



func show_this_on_book():
	
	
	if _global_datas.link_mode:
			return	
	
	if _global_datas.selected_photoData == null:
		_global_datas.selected_photoData = photo_data_first
	
	_global_datas.book_data.book_node._show_from_index(_global_datas.selected_photoData.page_index)
	
	var book = _global_datas.book_data.book_node

	var offset = Vector3(-0.02,0.0,-0.07)
	var book_position = book.position + offset
	_global_datas.focus_this_on_board.emit(book_position)		
	_global_datas.book_idle_pos = false		
	_global_datas.book_back_idle_position.emit(true)
	
	_global_datas._add_back_call.emit(back_call)
	
	
	
func back_call():
		_global_datas.book_back_idle_position.emit(false)	


func _on_on_click():
	show_this_on_book()
