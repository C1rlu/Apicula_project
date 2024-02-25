extends Node

var _pad : bool = false
@onready var pad_target = $"../SubViewport/Pad_target"
@onready var  Camera = $"../Camp_root_XRay/Camera_xray"

var selectable
signal active_scanner(condition : bool)



func _ready():
	_global_datas.using_pad.connect(_active_raycast)
	
func _active_raycast(condition : bool):
	_pad = condition			

func _input(event):



	if _global_datas.in_scanner_mode:
		return
		
	if event.is_action_released("Click"):
		if selectable:
			selectable.on_click.emit(false)
	
	if !_global_datas.Player_In_Inventory:
		return	
			
	if event.is_action_pressed("Click"):	
		if _pad: 
			var target = pad_target.position
			check_cast(target)		
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
	#print(result)
	if !result:
		if selectable: # Deselect selected photo data if exist
			if !_global_datas.in_scanner_mode:
				selectable.show_legend(false)
				selectable = null	 		
		return
	
	if selectable:
		selectable.show_legend(false)	
	selectable = result.collider.get_node_or_null("Select_this")	
	
	if selectable:	
		selectable.show_legend(true)
		selectable = selectable
	
		

