extends Node

var _pad : bool = false

@onready var  Camera = $"../3D_SCENE/Camp_root_XRay/Camera_xray"
@onready var pad_target = $"../3D_SCENE/Pad_target"

var previous_on_over
var On_Over
var boue_click
signal active_scanner(condition : bool)

func _ready():
	_global_datas.using_pad.connect(_active_raycast)

	
func _active_raycast(condition : bool):
	_pad = condition			

func _input(event):
	
	if _global_datas.in_text_type_mod:
		return
		
	if _global_datas.in_scanner_mode:
		return
	
			
	if !_global_datas.Player_In_Inventory:
		return	
	if _global_datas.zoom_value == 1:
		return
	
			
	if _pad: 
		var center_screen = Vector2i(640,360)
		check_on_over(center_screen)		
	else:
		var target = get_viewport().get_mouse_position()
		check_on_over(target)	
		

			
	if event.is_action_pressed("Click_on_board"):	

		if _pad: 
	
			var center_screen = Vector2i(640,360)

			check_cast(center_screen)		
		else:
			var target = get_viewport().get_mouse_position()
			check_cast(target)
	
	
				
	if event.is_action_released("Click_on_board"):	
		if boue_click:
			boue_click.lunch_teleport(false)	
			boue_click = false
		
		
func check_cast(targetPos : Vector2):
	
	var rayLengh = 250.0
	var from = Camera.project_ray_origin(targetPos)
	var to = from + Camera.project_ray_normal(targetPos) * rayLengh
	var space = Camera.get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.collision_mask = 7
	rayQuery.from = from
	rayQuery.to = to
	
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = false
	var result = space.intersect_ray(rayQuery)

	# IMPROVEMENT MAKE USE THE SAME EVENT NAME OF NODE LIKE "CLICK EVENT" AND USE SIGNAL ONLY AFTER
	# THEN THIS WILL WORK FOR EVERY CLICK EVENT AND WILL BE EASL EXTENSIBLE
	
	if !result:	
		return
	
	
	if result.collider.get_node_or_null("On_click"): 
		var _On_click = result.collider.get_node_or_null("On_click")
		_On_click.On_click.emit()


	if _global_datas.link_mode:	
		if result.collider.get_node_or_null("On_click_link"): 
			var _On_click = result.collider.get_node_or_null("On_click_link")
			_On_click.On_click.emit()

	if result.collider.get_node_or_null("Teleport_PlayerBoat"):
		var Teleport_PlayerBoat	= result.collider.get_node_or_null("Teleport_PlayerBoat")
		Teleport_PlayerBoat.lunch_teleport(true)
		boue_click = Teleport_PlayerBoat
		
		
		
func check_on_over(targetPos : Vector2):
	
	var rayLengh = 250.0
	var from = Camera.project_ray_origin(targetPos)
	var to = from + Camera.project_ray_normal(targetPos) * rayLengh
	var space = Camera.get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.collision_mask = 7
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = false
	
	var result = space.intersect_ray(rayQuery)

	if !result:
		if On_Over:
			On_Over.on_over(false)	
			On_Over = null	
		return
		
	if previous_on_over:
		previous_on_over.on_over(false)
		previous_on_over = null	
		
	if _global_datas.link_mode:	
		if result.collider.get_node_or_null("On_click_link"): 
			var button = result.collider.get_node_or_null("On_click_link")
			previous_on_over = button
			button.on_over(true)	

	if On_Over:
		On_Over.on_over(false)	
		On_Over = false
		 	
	#On_Over
	if result.collider.get_node_or_null("On_Over"): 
		On_Over = result.collider.get_node_or_null("On_Over")
		On_Over.on_over(true)	
	



