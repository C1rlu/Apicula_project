extends Node



@export var Camera : Camera3D
var On_Over
var _selectec_object : Node
var raycast

func _input(event):

	var target = get_viewport().get_mouse_position()
	
	if event.is_action_pressed("Click_on_board"):	
		check_cast(target)
	
	check_on_over(target)	
		
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

	
	#print(result)
	if !result:	
		return

	if !_selectec_object:
		
		if result.collider.get_node_or_null("On_click"): 
			var _On_click = result.collider.get_node_or_null("On_click")
			_selectec_object = _On_click
			_On_click.On_Move.emit(true)
	else:
		_selectec_object.On_Move.emit(false)
		_selectec_object = null	
		_global_datas.select_movable_object.emit(null)
	

		
			
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


	if _selectec_object:
		if result.collider.get_node_or_null("Position_zone"):
			_selectec_object.On_Position.emit(result.position)
		return			
	if On_Over:
		On_Over.on_over(false)	
		On_Over = false
		 	
	#On_Over
	if result.collider.get_node_or_null("On_Over"): 
		On_Over = result.collider.get_node_or_null("On_Over")
		On_Over.on_over(true)	



