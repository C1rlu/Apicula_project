extends Node3D

@onready var _book_page = $Book_page
@export var _book_data : book_page_data
var page_index = 0 

@onready var page_flip_right_root = $Page_flip_right_ROOT
@onready var page_flip_left_root = $Page_flip_left_ROOT


const PAGE_FLIP_PREFAB = preload("res://12_INVENTORY/Book/Page_flip/page_flip_right.tscn")

@onready var timer = $Timer
var is_turning = false

var previous_page : int = 0 

@onready var multiple_page_transition_right = $Multiple_page_transition_right
@onready var multiple_page_transition_left = $Multiple_page_transition_left




var multiple_page_index : int = 0

func _ready():

	_book_page.book_data = _book_data 
	_book_data.book_node = $"." 

	_global_datas.turn_left.connect(update_page_left)
	_global_datas.turn_right.connect(update_page_right)
	
func update_page_right():
	
	if is_turning:
		return
	
	page_index += 1	
	previous_page = page_index
	
	if page_index == _book_data.book_pages.size():
		page_index = _book_data.book_pages.size()-1
		return
		
	is_turning = true	
	timer.start()
	
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_right_root.add_child(_page)
	_page.turn_page.emit()		
	_book_page.set_content.emit(page_index)
	
func update_page_left():
	
	if is_turning:
		return
		
	page_index -= 1	
	previous_page = page_index
		
	if page_index == -1:
		page_index = 0
		return
	
	is_turning = true	
	timer.start()
	
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_left_root.add_child(_page)
	_page.turn_page.emit()		
	
	_book_page.set_content.emit(page_index)
	

func _show_from_index(index):
	
	if is_turning:
		return
	page_index = index
	
	is_turning = true	
	timer.start()
	
	#for page direction 
	if index == previous_page:
		return
		
	# to active multiple page	
	var difference = abs(index - previous_page )
	#print(difference, "PAGE DIFF")
	if difference != 1:
		if index > previous_page:
			multiple_page_right()
		else :
			multiple_page_left()
		previous_page = index
		return
		
	if index > previous_page:
		var _page = PAGE_FLIP_PREFAB.instantiate()
		page_flip_right_root.add_child(_page)
		_page.turn_page.emit()		
	else :
		var _page = PAGE_FLIP_PREFAB.instantiate()
		page_flip_left_root.add_child(_page)
		_page.turn_page.emit()	

	previous_page = index
	_book_page.set_content.emit(page_index)	
				
					
func multiple_page_right():
	multiple_page_transition_right.start()		
func multiple_page_left():
	multiple_page_transition_left.start()	
	
		
func _turn_page_right():
	update_page_right()


func turn_page_left():
	update_page_left()


func _on_timer_timeout():
	is_turning = false


func _on_multiple_page_transition_timeout():
	
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_right_root.add_child(_page)
	_page.turn_page.emit()	
		
	multiple_page_index += 1		
	if multiple_page_index == 3:
		multiple_page_index = 0
		multiple_page_transition_right.stop()	
		_book_page.set_content.emit(page_index)
		


func _on_multiple_page_transition_left_timeout():
	
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_left_root.add_child(_page)
	_page.turn_page.emit()	
		
	multiple_page_index += 1		
	if multiple_page_index == 3:
		multiple_page_index = 0
		multiple_page_transition_left.stop()	
		_book_page.set_content.emit(page_index)
