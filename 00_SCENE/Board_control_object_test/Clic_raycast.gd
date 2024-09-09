extends Node

@export var Camera : Camera3D
var _selectec_object 
var pad : bool = false
@export var pad_target : ColorRect

var target 
var last_target 

var active_on_Over
@onready var utility = GameUtility.new() #to call raycast func
func _ready():
	
	_global_datas.using_pad.connect(is_pad)
	_global_datas.select_movable_object.connect(select_object)


	_global_datas.open_inventory.connect(check_if_on_focus)

	
func check_if_on_focus(condition):
	
	if condition:
		return
		
	if _global_datas.camera_current_state == game_state.camera_state.Board_Focus_element:
		_global_datas.camera_focus_On.emit(_global_datas.previous_cam_state)
		_global_datas.show_element_info.emit(false,null)
		return
	
	if _global_datas.camera_current_state == game_state.camera_state.Scanner:
		_global_datas.show_on_scanner.emit(false)
		_global_datas.camera_focus_On.emit(_global_datas.previous_cam_state)
		_global_datas.show_element_info.emit(false,null)
		return	
		
func select_object(object):
	_selectec_object = object

func is_pad(condition : bool):
	
	pad = condition

	
func _input(event):
	
	
	if _global_datas._on_button_ui:
		return
		
	if !_global_datas.Player_In_Inventory:
		return
	
	if _global_datas.Player_InDialogue:
		return
		
	if _global_datas.Player_InMenu:
		return
	if pad:
		target = pad_target.position
	else:
		target = get_viewport().get_mouse_position()	
	

	
	if _global_datas.camera_current_state == game_state.camera_state.Board_Focus_element:
		if event.is_action_pressed("on_view"):	

			_global_datas.camera_focus_On.emit(_global_datas.previous_cam_state)
			_global_datas.show_element_info.emit(false,null)
			
		return
	

	if _global_datas.camera_current_state == game_state.camera_state.BoardZoom:
		if event.is_action_pressed("on_view"):	
	
			_global_datas.camera_focus_On.emit(_global_datas.previous_cam_state)	
			_global_datas.show_element_info.emit(false,null)

		return
		
		
	#action click below 	
	if event.is_action_pressed("on_move"):
		if _selectec_object:
			_selectec_object.On_Move.emit(false)
			
		else:
			check_move(target)
			
	if event.is_action_pressed("on_view"):	
		check_view(target)
	
	# On Over check
	check_over(target)	
		


func check_move(targetPos : Vector2):
	
	var ray_target = utility.get_raycast_target(targetPos,Camera)

	if !ray_target:	
		return
		
	if !_selectec_object:
		if  ray_target.collider.get_node_or_null("On_Move"): 
			
			var _On_click =  ray_target.collider.get_node_or_null("On_Move")
			_On_click.On_Move.emit(true)

			
func check_view(targetPos : Vector2):
	
	
	var ray_target = utility.get_raycast_target(targetPos,Camera)
	#print( ray_target)
	if !ray_target:	
		return

	if  ray_target.collider.get_node_or_null("On_View"): 
		var _on_view =  ray_target.collider.get_node_or_null("On_View")
		if _on_view:
			_on_view.On_View.emit()
			
func check_over(targetPos : Vector2):
	
	
	if active_on_Over:
		_global_datas.show_element_info.emit(false,null)
		active_on_Over.On_Over.emit(false)
		active_on_Over = null
		
	
	var ray_target = utility.get_raycast_target(targetPos,Camera)
	
	if !ray_target:	
		return
		
	if !_selectec_object:
		if  ray_target.collider.get_node_or_null("On_Over"): 
	
			var _On_Over =  ray_target.collider.get_node_or_null("On_Over")
			_On_Over.On_Over.emit(true)
			active_on_Over = _On_Over
	

								
	
func _process(delta):
		

		if _selectec_object:
			
			var ray_target = utility.get_raycast_target(target,Camera)
			
			if ray_target:
				if ray_target.collider.get_node_or_null("Position_zone"):

					_selectec_object._move.emit(ray_target,10,delta)	
					last_target = ray_target
			else:
				if !ray_target:
					return
				_selectec_object._move.emit(last_target,10,delta)
