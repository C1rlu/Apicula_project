extends Node

var _pad : bool = false

@onready var  Camera = $"../3D_SCENE/Camp_root_XRay/Camera_xray"

var selectable
signal active_scanner(condition : bool)


func _ready():
	_global_datas.using_pad.connect(_active_raycast)
	
func _active_raycast(condition : bool):
	_pad = condition			

func _input(event):

	if _global_datas.in_scanner_mode:
		return
		
	if event.is_action_released("Click_on_board"):
		if selectable:
			selectable.on_click.emit(false)
		
			
	if !_global_datas.Player_In_Inventory:
		return	
			
	if event.is_action_pressed("Click_on_board"):	
		if _pad: 
	
			var center_screen = Vector2i(640,360)

			check_cast(center_screen)		
		else:
			var target = get_viewport().get_mouse_position()
			check_cast(target)
	
		if selectable:
			selectable.on_click.emit(true)
		

		
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
		if selectable: # Deselect selected photo data if exist
			if !_global_datas.in_scanner_mode:
				selectable.show_legend(false)
				selectable = null	 		
		return
	
	if result.collider.get_node_or_null("Book_exit"): 
		var _exit = result.collider.get_node_or_null("Book_exit") 
		_exit._book_exit()
		
			
	if result.collider.get_node_or_null("Page_event"): 
		var page = result.collider.get_node_or_null("Page_event")
		page.trigger_page_event.emit()	 

		

	if selectable:
		selectable.show_legend(false)	
	selectable = result.collider.get_node_or_null("Select_this")	
		
	if selectable:	
		selectable.show_legend(true)
		selectable = selectable
		

	#if result.collider.get_node_or_null("Loupe"): 
		#var loupe = result.collider.get_node_or_null("Loupe") 
		#loupe._show_only_map()
			

	if result.collider.get_node_or_null("Select_Tube"): 
		var tube = result.collider.get_node_or_null("Select_Tube") 
		tube._select_tube()		
		
	if result.collider.get_node_or_null("Turn_page"):
		var right_page = result.collider.get_node_or_null("Turn_page") 
		right_page._turn_page.emit()		


	if result.collider.get_node_or_null("Show_this_page"):
		var page_index = result.collider.get_node_or_null("Show_this_page")
		page_index.show_this_page.emit()	

	
	if result.collider.get_node_or_null("map"): 
		#for show map only are photo	
		_global_datas.photo_are_active =!_global_datas.photo_are_active
		
		if _global_datas.photo_are_active:
			_global_datas.photo_fade_out.emit()
			_global_datas.book_fade_out.emit()
		else:
			_global_datas.photo_fade_in.emit()	
			
			_global_datas.book_fade_in.emit()	
			
	
		_global_datas.map_fade.emit(!_global_datas.photo_are_active)



