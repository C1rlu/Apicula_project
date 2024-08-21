extends Node3D

@export var speed : float = 0.5
var current_speed : float
@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0
var border_ratio : float = 22

var target_position : Vector3
var f
var on_auto_move = false

var center_position : Vector3
var stop_move : bool = false


func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)
	center_position = global_position
	target_position =  center_position
	_global_datas.camera_focus_On.connect(check_if_previous_focus)
	current_speed = speed
	
	#_global_datas.back_to_element_state.connect(back_to_element_state)
	
func stop(condition : bool):
	stop_move = condition 	
	
	
func back_to_element_state():
	_focus_this(center_position)	

	
func check_if_previous_focus(focus_state : boardCamState_data):

	# to return to the last position after a focus

	if _global_datas.camera_current_state == game_state.camera_state.Board_Focus_element:
		_global_datas.previous_cam_target = global_position 
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		_global_datas.previous_cam_target = global_position 
	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		_global_datas.previous_cam_target = global_position 

func _process(delta):
	
	
	if _global_datas.Player_InMenu:
		return
	
	if !_global_datas.Player_In_Inventory:
		return

	if stop_move:
		return
		
	if _global_datas.in_open_element_state:
		return	
		
	if _global_datas.camera_current_state == game_state.camera_state.Board_Focus_element:
		return	
	if _global_datas.camera_current_state == game_state.camera_state.Main:
		move(delta)	
		current_speed = speed * 1.5	
		return

	if _global_datas.camera_current_state == game_state.camera_state.Board:
		move(delta)	
		current_speed = speed 	
		return
	
	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		#move(delta)
		#current_speed = speed /2		
		return
		
func move(delta):
	
	if Input.is_action_pressed(_global_datas.move_right):
		var _magnitude = Input.get_action_strength(_global_datas.move_right)
		target_position.x += _magnitude * current_speed * delta
	if Input.is_action_pressed(_global_datas.move_left):
		var _magnitude = Input.get_action_strength(_global_datas.move_left)
		target_position.x -= _magnitude * current_speed * delta	
	if Input.is_action_pressed(_global_datas.move_forward):
		var _magnitude = Input.get_action_strength(_global_datas.move_forward)
		target_position.z -= _magnitude * current_speed * delta	
	if Input.is_action_pressed(_global_datas.move_backward):
		var _magnitude = Input.get_action_strength(_global_datas.move_backward)
		target_position.z += _magnitude * current_speed * delta
	
	var lerp_value = (border_ratio - 22.0) / (42.0 - 22.0)	
	var oneminus = lerp(1.0,0.0,lerp_value)
	
	target_position.x = clamp(target_position.x, oneminus * min_x, oneminus * max_x)
	target_position.z = clamp(target_position.z, oneminus * min_z, oneminus * max_z)


	global_position = target_position

func _focus_this(_position):
	
	on_auto_move = true
	
	if f:
		f.kill()
	
	f = create_tween()
	f.tween_property(self,"position",_position,0.25)
	f.connect("finished",done)
	
func done():
	target_position = global_position
	on_auto_move = false
	
