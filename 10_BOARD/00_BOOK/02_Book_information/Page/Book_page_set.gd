extends Node3D

var book_data : book_page_data

@onready var page_render = $Render_text
@onready var page_viewport_render = $Book_inputViewports/SubViewport


signal set_content(content : PackedScene)

var fade_in 
@onready var timer = $Timer


func show_off():

	if fade_in:
		fade_in.kill()
		
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,0.0,1.0,0.25)
		

	
func _on_set_content(content):
	
	var child = page_viewport_render.get_children()
	
	for p in child:
		p.queue_free()
		
	var p_render = content.instantiate()
	page_viewport_render.add_child(p_render)	

	timer.start()

func _fade_back():

	if fade_in:
		fade_in.kill()
		
	fade_in = create_tween()
	fade_in.tween_method(set_shader_value,1.0,0.0,0.25)

func set_shader_value(value):

	page_render.transparency = value


func _on_timer_timeout():
	_fade_back()


