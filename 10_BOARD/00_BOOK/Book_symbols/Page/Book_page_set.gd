extends Node3D

var book_data : book_page_data

@onready var page_render = $Render_text
@onready var page_viewport_render = $Book_inputViewports/SubViewport
@onready var init_timer = $Init_timer


signal show_content(condition : bool)
signal set_content(page_index : int)

var fade_in 
@onready var timer = $Timer

var page_new_index : int 

func _ready():
	init_timer.start()


func show_this_page(page_index : int):
	
	
	var child = page_viewport_render.get_children()
	
	for p in child:
		p.queue_free()
		
	var instance_this_page = book_data.book_pages[page_index].pages.instantiate()
	page_viewport_render.add_child(instance_this_page)


func _on_show_content(condition):
	page_render.visible = condition


func _on_set_content(page_index):

	print(page_index)
	page_new_index = page_index	
	
	if fade_in:
		fade_in.kill()
		
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,0.0,1.0,0.25)
	
	
	timer.start()

func _fade_back():


	show_this_page(page_new_index)
	if fade_in:
		fade_in.kill()
		
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,1.0,0.0,0.25)

func set_shader_value(value):

	page_render.transparency = value


func _on_timer_timeout():
	_fade_back()


func _on_init_timer_timeout():
	show_this_page(0)
