extends Node

var ray_cast_cam : Camera3D

var _is_active : bool = false
func _ready():

	_global_datas._take_photo.connect(_check_target)

	ray_cast_cam = _global_datas.Subscene_Camera
	
	_global_datas._go_Subscene.connect(func active():
		_is_active = true	
	
	)	
	
	_global_datas._backFrom_subscene.connect(func disable():
		_is_active = false	
	
	)
	

func _input(event:InputEvent):
	
	if !_is_active:
		return	
		
	if _global_datas.Player_lock_click:
		return
	

	if event.is_action_pressed("Click"):
		_check_target()

	
func _check_target():
	
	# here to get the photo data or object by raycast on the 3d element
	var ray_position = raycast_from_mouse()
		
	if ray_position != null:
		print(ray_position.collider)
		var photo_data_node = ray_position.collider.get_node_or_null("Photo_data")
		if photo_data_node:
			var photo_data_rs : PhotoData = photo_data_node.get_PhotoData()
			_global_datas._instance_photo.emit(photo_data_rs)			

			
		var mirror_data = ray_position.collider.get_node_or_null("Mirror")
		if mirror_data:
			_global_datas._click_mirror_switch.emit()

		var lootable_data = ray_position.collider.get_node_or_null("Lootable")
		if lootable_data :
			var lootable_data_rs : Loot_Data = lootable_data.get_lootable()
			_global_datas._find_loot.emit(lootable_data_rs)



func raycast_from_mouse():
	
	
	var mouse_position = get_viewport().get_mouse_position()
	
	const RAY_LENGTH = 2.0
	

	var camera3d = ray_cast_cam
	
	var ray_start = camera3d.project_ray_origin(mouse_position)
	var ray_end = ray_start + camera3d.project_ray_normal(mouse_position) * RAY_LENGTH
	var world3d : World3D = get_viewport().get_world_3d()
	var space_state = world3d.direct_space_state
	
	var collision_mask = 2
	var query = PhysicsRayQueryParameters3D.create(ray_start, ray_end, collision_mask)
	query.collide_with_areas = true
	query.collide_with_bodies = true
	
	var result = space_state.intersect_ray(query)
	
	if result:
		return result	
	
	

