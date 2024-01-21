extends Node


@export var margin : float
@export var scale_in_hand = 1.10
@export var scale_in_loupe = 2.0
@onready var control = $".."
@export var go_bottom : bool

@onready var area_2d = $"../Area2D"

var Pin_book : Node2D

var mouse_entered = false
var in_book_zone = false
var click = false
var offset

var size : float

var my_origin_parent : Node
var show_map

var kill_on_pos : bool = false 

var last_position : Vector2

var change_photo 
var legend


func _ready():
	size = control.scale.x
	my_origin_parent = control.get_parent()
	last_position = control.transform.origin
	Pin_book = get_node_or_null("../Pin_book")
	show_map = get_node_or_null("../Show_map_grid")
	change_photo = get_node_or_null("../Change_photo")
	
	
	legend = get_node_or_null("../Legend")
	
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _process(_delta):

	if !click:
		return	
		
	var new_position = control.get_global_mouse_position() + offset
	new_position.x = clamp(new_position.x,margin,1920-margin)
	new_position.y = clamp(new_position.y,margin,1080-margin)
	control.global_position = new_position
	

	#print(_check_book_position())	
			
func _input(event):

	#TO DRAG
	if !_global_datas.Player_lock_click == true:
		
		if Input.is_action_just_pressed("Click") && mouse_entered:
			click = true
			_global_datas.Player_lock_click = true
			control.reparent(my_origin_parent)
			_scale_change(size * scale_in_hand)
			offset = control.transform.origin - control.get_global_mouse_position()
			_global_datas.OnDrag_start_position = offset
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			if show_map != null : _global_datas._active_world_grid.emit(true)
				
		
			move_behind()
			
			if !go_bottom:
				control.move_to_front()
			
	#TO ZOOM	
	if click:
		
		if Input.is_action_just_pressed("Zoom_object"):	
			_scale_change(size * scale_in_loupe)
			var select_parent = _global_datas.In_Front_Node
			control.reparent(select_parent)
			control.move_to_front()
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)	
			
			if legend:
				var legend_text = legend.get_legend()
				_global_datas._show_object_legend.emit(true,legend_text)
			else:
				var legend_text = "please add a legend node to this item"
				_global_datas._show_object_legend.emit(true,legend_text)
				
			if change_photo:
				change_photo._change_photo_shade()
			
			
		if Input.is_action_just_released("Zoom_object"):
			_scale_change(size)
			control.reparent(my_origin_parent)
		
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			_global_datas._show_object_legend.emit(false,"")
			
		#TO DROP
		if event is InputEventMouseButton :
			if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
				_unselect_element(in_book_zone,true)
				
				
func _scale_change(value):
	
	control.set_scale(Vector2(value,value))


func _unselect_element(condition : bool, move_behind_c : bool):
	click = false
	_global_datas.Player_lock_click = false
	_scale_change(size)
	
	_global_datas._show_object_legend.emit(false,"")
	# KILL IF BOUGIE ON IT 
	if kill_on_pos:
		var burn_it = area_2d.get_node_or_null("I_Burn")
		if burn_it != null:
			burn_it._destroy()	
				
	if show_map != null : _global_datas._active_world_grid.emit(false)
	
	
	var page_position = _check_book_position()
	if page_position =="outside":
		return
	var pages = _global_datas.Book_pages[_global_datas.Book_page_index]
	if page_position  == "right":
		var side_right : Node2D = pages.get_node("right")
		control.reparent(side_right)	
			
	if page_position  == "left":		
		var side_left : Node2D = pages.get_node("left")
		control.reparent(side_left)			
		
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if !move_behind_c:
		return
	
	
	move_behind()
	_global_datas.lock_page.emit()
	
func _check_book_position():
	
	var page_position : String = "oustide"
	var pages = _global_datas.Book_pages[_global_datas.Book_page_index]
		
	if  pages.get_node_or_null("not_here") != null:	
		return
	var _position = control.get_global_mouse_position()
	if _position.x > 960.0 and _position.x < 1690 and _position.y > 360:
		var side_right : Node2D = pages.get_node("right")
		#control.reparent(side_right)	 
		page_position = "right"
	elif _position.x < 960.0 and _position.x > 200 and _position.y > 360 :
		var side_left : Node2D = pages.get_node("left")
		#control.reparent(side_left)	
		page_position = "left"			
	else:
		page_position = "outside"
					
	return page_position
		
func _notification(what):
	#if what == NOTIFICATION_WM_FOCUS_IN:
	if click:
		if what == NOTIFICATION_WM_MOUSE_EXIT:
			_unselect_element(in_book_zone,false)
	
func move_behind():
	
	var behind = area_2d.get_overlapping_areas()
	
	if behind == null:
		return
				
	for a in behind:
		var behind_node = a.get_node_or_null("Apply_pos_behind")		
		if behind_node == null:
			return
					
		var c = a.get_node("Apply_pos_behind")
		c._move_behind()
		
		
func _on_area_2d_mouse_entered():

	mouse_entered = true
	
	_global_datas.Cursor_mode.cursor_in()
	

func _on_area_2d_mouse_exited():
	mouse_entered = false

	_global_datas.Cursor_mode.cursor_out()



func _in_book_zone(condition : bool):
	
	return
	
	var pages = _global_datas.Book_pages[_global_datas.Book_page_index]
		
	if  pages.get_node_or_null("not_here") != null:
		if Pin_book != null :Pin_book.visible = false
		return
	
	in_book_zone = condition
	if Pin_book != null :Pin_book.visible = condition
	


