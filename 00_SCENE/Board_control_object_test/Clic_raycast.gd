extends Node

@export var Camera : Camera3D
var _selectec_object 
var pad : bool = false
@export var pad_target : ColorRect

var target 
var last_target 

var active_on_Over

func _ready():
	
	_global_datas.using_pad.connect(is_pad)
	_global_datas.select_movable_object.connect(select_object)

func select_object(object):
	_selectec_object = object

func is_pad(condition : bool):
	
	pad = condition
	pad_target.visible = condition
	
func _input(event):
	
	
	#if !_global_datas.Player_In_Inventory:
		#return
	
	if pad:
		target = pad_target.position
	else:
		target = get_viewport().get_mouse_position()	
	
	#action click below 	
	if event.is_action_pressed("On_Move"):
		if _selectec_object:
			_selectec_object.On_Move.emit(false)
		else:
			check_move(target)
			
	if event.is_action_pressed("On_View"):	
		check_view(target)

	# On Over check
	check_over(target)	
		


func check_move(targetPos : Vector2):
	
	var ray_target = get_raycast_target(targetPos)
	#print( ray_target)
	if !ray_target:	
		return
		
	if !_selectec_object:
		if  ray_target.collider.get_node_or_null("On_Move"): 
	
			var _On_click =  ray_target.collider.get_node_or_null("On_Move")
			_On_click.On_Move.emit(true)
					
			
func check_view(targetPos : Vector2):
	
	
	var ray_target = get_raycast_target(targetPos)
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
		active_on_Over = null
	
	var ray_target = get_raycast_target(targetPos)
	#print( ray_target)
	if !ray_target:	
		return
		
	if !_selectec_object:
		if  ray_target.collider.get_node_or_null("On_Over"): 
	
			var _On_Over =  ray_target.collider.get_node_or_null("On_Over")
			_On_Over.On_Over.emit()
			active_on_Over = _On_Over
	

								
func get_raycast_target(targetPos : Vector2) -> Dictionary:
	
	var rayLengh = 250.0
	var from = Camera.project_ray_origin(targetPos)
	var to = from + Camera.project_ray_normal(targetPos) * rayLengh
	var space = Camera.get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.collision_mask = 1
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = false
	
	var result = space.intersect_ray(rayQuery)

	return result
	
func _process(delta):
		

		if _selectec_object:
			
			var ray_target = get_raycast_target(target)
			
			if ray_target:
				if ray_target.collider.get_node_or_null("Position_zone"):

					_selectec_object._move.emit(ray_target,10,delta)	
					last_target = ray_target
			else:
				if !ray_target:
					return
				_selectec_object._move.emit(last_target,10,delta)
