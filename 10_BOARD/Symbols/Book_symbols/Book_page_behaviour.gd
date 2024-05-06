extends Node

@onready var book_page = $Book_page
@export var _book_data : book_page_data
var page_index = 0 

@onready var page_flip_right = $Page_flip_right
@onready var page_flip_left = $Page_flip_left

@onready var timer = $Timer
var is_turning = false

var previous_page : int = 0 

func _ready():

	book_page.book_data = _book_data 
	#_global_datas.show_symbols_book_page.connect(_show_from_index)
	_book_data.book_node = $"." 
	
func update_page_right():
	
	if is_turning:
		return
	
	page_index += 1	

	if page_index == _book_data.pages.size():
		page_index = _book_data.pages.size()-1
		return
		
	is_turning = true	
	timer.start()
	page_flip_right.turn_page.emit()		
	book_page.set_content.emit(page_index)
	
	#auto_right.start()
	
		
func update_page_left():
	
	if is_turning:
		return
		
	page_index -= 1	
		
	if page_index == -1:
		page_index = 0
		return
	
	is_turning = true	
	timer.start()
	page_flip_left.turn_page.emit()	
	book_page.set_content.emit(page_index)

func _show_from_index(index):
	
	if is_turning:
		return
	page_index = index
	
	is_turning = true	
	timer.start()
	
	
	#for page direction 
	if index == previous_page:
		return
		
	if index > previous_page:
		page_flip_right.turn_page.emit()	
	else :
		page_flip_left.turn_page.emit()	
	previous_page = index
	
	book_page.set_content.emit(page_index)					
	
	
	
func _turn_page_right():
	update_page_right()


func turn_page_left():
	update_page_left()


func _on_timer_timeout():
	is_turning = false



