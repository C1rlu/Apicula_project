extends Node

@export var order_priority : int
@export var margin : float
@export var scale_in_hand = 1.10
@export var scale_in_loupe = 2.0
@onready var control = $".."

@export var go_bottom : bool
@onready var select_parent = $"../../../Select_parent"


@onready var area_2d = $"../Area2D"
#@onready var shadow = $"../shadow"


var mouse_entered = false
var click = false
var offset

var size : float

var my_origin_parent : Node

signal pos_anim

func _ready():
	size = control.scale.x
	my_origin_parent = control.get_parent()
	
func _process(_delta):
	
	if !click:
		return
		
	var new_position = control.get_global_mouse_position() + offset
	new_position.x = clamp(new_position.x,margin,1920-margin)
	new_position.y = clamp(new_position.y,margin,1080-margin)
	control.global_position = new_position
	

		
func _input(event):
	
	
	#TO DRAG
	if !_global_datas.Player_lock_click == true:
		
		if Input.is_action_just_pressed("Click") && mouse_entered:
			click = true
			_global_datas.Player_lock_click = true
			_scale_change(size * scale_in_hand)
			offset = control.transform.origin - control.get_global_mouse_position()
			#shadow.visible = true
			_global_datas.OnDrag_start_position = offset
			
			move_behind()
			
			if !go_bottom:
				control.move_to_front()
			
	#TO ZOOM	
	if click:
		if Input.is_action_just_pressed("Zoom_object"):
			
			_scale_change(size * scale_in_loupe)
			control.reparent(select_parent)
			control.move_to_front()
			_global_datas.using_board_enable.emit()
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			
		if Input.is_action_just_released("Zoom_object"):
			_scale_change(size * scale_in_hand)
			control.reparent(my_origin_parent)
			_global_datas.using_board_disable.emit()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		#TO DROP
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
				_unselect_element()
	
				
func _scale_change(value):
	
	control.set_scale(Vector2(value,value))


func _unselect_element():
	
	click = false
	_global_datas.Player_lock_click = false
	_scale_change(size)
	_global_datas.using_board_disable.emit()
	control.reparent(my_origin_parent)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#shadow.visible = false
	pos_anim.emit()
	move_behind()
	
	
func _notification(what):
	#if what == NOTIFICATION_WM_FOCUS_IN:
	if what == NOTIFICATION_WM_MOUSE_EXIT:
		click = false
		_global_datas.Player_lock_click = false
		_scale_change(size)
		_global_datas.using_board_disable.emit()
		control.reparent(my_origin_parent)
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#shadow.visible = false
			
		
			
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
	var value = 2 as int 
	Input.set_default_cursor_shape(value)

func _on_area_2d_mouse_exited():
	mouse_entered = false
	var value = 0 as int 
	Input.set_default_cursor_shape(value)



