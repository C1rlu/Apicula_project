extends Node

var _pad : bool = false

@onready var  Camera = $"../3D_SCENE/Camp_root_XRay/Camera_xray"
@onready var pad_target = $"../3D_SCENE/Pad_target"

var previous_on_over
var On_Over
var Close_choice
var boue_click
signal active_scanner(condition : bool)

func _ready():
	_global_datas.using_pad.connect(_active_raycast)

	
func _active_raycast(condition : bool):
	_pad = condition			

func _input(event):
	

	if _global_datas.in_scanner_mode:
		return
	
			
	if !_global_datas.Player_In_Inventory:
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


	if !result:	
		return
	
	if result.collider.get_node_or_null("Book_exit"): 
		var _exit = result.collider.get_node_or_null("Book_exit") 
		_exit._book_exit()
		
			
	if result.collider.get_node_or_null("Page_event"): 
		var page = result.collider.get_node_or_null("Page_event")
		page.trigger_page_event.emit()	 

		
		
	
	if result.collider.get_node_or_null("push_button"): 
		var button = result.collider.get_node_or_null("push_button")
		button.push()	 

	if result.collider.get_node_or_null("Select_Tube"): 
		var tube = result.collider.get_node_or_null("Select_Tube") 
		tube._select_tube()		
		
	if result.collider.get_node_or_null("Turn_page"):
		var right_page = result.collider.get_node_or_null("Turn_page") 
		right_page._turn_page.emit()		


	if result.collider.get_node_or_null("Show_this_page"):
		var page_index = result.collider.get_node_or_null("Show_this_page")
		page_index.show_this_page.emit()	

	if result.collider.get_node_or_null("Show_scanner"):
		var Show_scanner = result.collider.get_node_or_null("Show_scanner")
		Show_scanner.show_scanner.emit()	

	if result.collider.get_node_or_null("Loupe"):
		var Loupe = result.collider.get_node_or_null("Loupe")
		Loupe._show_scanner()	
		
	if result.collider.get_node_or_null("Signet"):
		var Signet = result.collider.get_node_or_null("Signet")
		Signet.show_this_page.emit()	

	if result.collider.get_node_or_null("Book_exit"):
		var Book_exit = result.collider.get_node_or_null("Book_exit")
		Book_exit._book_exit()	
			
			
	
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
		return
		
	if previous_on_over:
		previous_on_over.on_over(false)
		previous_on_over = null	
	
	if result.collider.get_node_or_null("push_button"): 
		var button = result.collider.get_node_or_null("push_button")
		previous_on_over = button
		button.on_over(true)	
	
	if Close_choice:
		Close_choice._close_choice()
		Close_choice = null
			
	if result.collider.get_node_or_null("Close_choice"):
		Close_choice = result.collider.get_node_or_null("Close_choice")
		
	
	if On_Over:
		On_Over.on_over(false)	
		On_Over = false
		 	
	#On_Over
	if result.collider.get_node_or_null("On_Over"): 
		On_Over = result.collider.get_node_or_null("On_Over")
		On_Over.on_over(true)	
	
	if result.collider.get_node_or_null("Select_this"): 
		var button = result.collider.get_node_or_null("Select_this")
		button.show_legend(true)	



