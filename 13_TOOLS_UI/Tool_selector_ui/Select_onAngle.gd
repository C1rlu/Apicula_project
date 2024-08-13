extends Node

@onready var center = $"../Center"


var _is_active : bool = false
var button_list : Array[Button]
var target_position : Vector3
var using_pad : bool = false
var previous_angle_selected : float

signal select_tool(tool : tool_data)

func _ready():
	_global_datas.open_tool_selector.connect(_active)
	_global_datas.using_pad.connect(is_pad)
	
	
func is_pad(condition : bool):
	using_pad = condition

func _active(condition : bool):
	_is_active = condition	
	update_button_list()



	if condition:
		get_closet_button(previous_angle_selected)
		
		if using_pad:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
				
func _input(event):
	
	if  !_global_datas.Player_InSubScene:
		return
	
	if !_is_active:
		return
		
	check_angle()
func update_button_list():

	button_list.clear()
	var all_b = center.get_children()	
	
	for b in all_b:
		if b.visible:
			button_list.append(b)	


func check_angle():
	
	var target_angle : Vector2
	
	if using_pad:
		#target_angle = Input.get_vector("move_right", "move_left","move_backward" , "move_forward")
		target_angle = Input.get_vector("Joy_2_right","Joy_2_left","Joy_2_bottom","Joy_2_top")
		if target_angle == Vector2.ZERO:
			return
			
		var angle = atan2(-target_angle.y,-target_angle.x)
		var degree = rad_to_deg(angle)
		
		get_closet_button(degree)
		
	else:
		target_angle = get_viewport().get_mouse_position()
		var center_position = center.global_position
		var angle = center_position.angle_to_point(target_angle)
		var degree = rad_to_deg(angle)
		get_closet_button(degree)
		
	
func get_closet_button(angle : float):
	
	var _closest_button = null
	var closest_distance = 180.0

	for b in button_list:
		var center_position = center.global_position
		var b_position = center_position.angle_to_point(b.global_position)	
		var b_degree : float = rad_to_deg(b_position)
		
		var angle_diff = abs(angle - b_degree)
		
		if angle_diff < closest_distance:
			closest_distance = angle_diff
			_closest_button = b
			b.grab_focus()
			previous_angle_selected = angle
			select_tool.emit(b.tool)

