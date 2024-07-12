extends Node3D

@onready var _book_page = $Book_page
@export var _book_data : book_page_data

@onready var page_flip_right_root = $Page_flip_right_ROOT
@onready var page_flip_left_root = $Page_flip_left_ROOT

const PAGE_FLIP_PREFAB = preload("res://12_INVENTORY/Book/Page_flip/page_flip_right.tscn")

@onready var multiple_page_transition_right = $Multiple_page_transition_right
@onready var multiple_page_transition_left = $Multiple_page_transition_left

var multiple_page_index : int = 0
var page_content : PackedScene


func _ready():

	_book_page.book_data = _book_data 
	_book_data.book_node = $"." 
	_global_datas.book_data = _book_data
	
	_global_datas.show_page.connect(_show_from_index)
	
func _show_from_index(content):
	
	if page_content == content:
		return
	page_content = content
	var random_direction = randf_range(0,10)
	
	if random_direction > 5:
		multiple_page_transition_right.start()		
	
	else :
		multiple_page_transition_left.start()
	

func _on_multiple_page_transition_timeout():
	
	multiple_page_index += 1
	var random_max_page = randi_range(1,3)

	if multiple_page_index > random_max_page:
		multiple_page_index = 0
		multiple_page_transition_right.stop()	

		_book_page.set_content.emit(page_content)
		return
	
	_book_page.show_off()
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_right_root.add_child(_page)
	_page.turn_page.emit()	
	

	
func _on_multiple_page_transition_left_timeout():
	
	multiple_page_index += 1
	var random_max_page = randi_range(1,3)
	if multiple_page_index > random_max_page:
		multiple_page_index = 0
		multiple_page_transition_left.stop()	
		_book_page.set_content.emit(page_content)
		return
		
		
	_book_page.show_off()
	var _page = PAGE_FLIP_PREFAB.instantiate()
	page_flip_left_root.add_child(_page)
	_page.turn_page.emit()	


