extends Node

@export var Camera : Camera3D
var _selectec_object : Node
var _obj : Node3D
var pad : bool = false
@onready var pad_target = $"../Pad_target"
var target 
func _ready():
	
	_global_datas.using_pad.connect(is_pad)


func is_pad(condition : bool):
	
	pad = condition
	pad_target.visible = condition
	
func _input(event):
	
	if pad:
		target = pad_target.position
	else:
		target = get_viewport().get_mouse_position()	
		
	if event.is_action_pressed("edit_board_state"):	
		check_move(target)
		
	if event.is_action_pressed("Click_on_board"):	
		if _selectec_object:	
			_global_datas.switch_state.emit(false)
			_selectec_object.On_Move.emit(false)
			_selectec_object = null	
			_global_datas.select_movable_object.emit(null)
		else:
			check_view(target)
		
		
func check_move(targetPos : Vector2):
	
	var ray_target = get_raycast_target(targetPos)
	#print( ray_target)
	if !ray_target:	
		return
		
	if !_selectec_object:
		if  ray_target.collider.get_node_or_null("On_Move"): 
			var _On_click =  ray_target.collider.get_node_or_null("On_Move")
			_selectec_object = _On_click
			_obj = _On_click.get_obj()
			_On_click.On_Move.emit(true)
			_global_datas.switch_state.emit(true)

func check_view(targetPos : Vector2):
	
	var ray_target = get_raycast_target(targetPos)
	#print( ray_target)
	if !ray_target:	
		return

	if  ray_target.collider.get_node_or_null("On_View"): 
		var _on_view =  ray_target.collider.get_node_or_null("On_View")
		if _on_view:
			_on_view.On_View.emit()
	
func get_raycast_target(targetPos : Vector2) -> Dictionary:
	
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
	return result
	
func _process(delta):
	
		if _selectec_object:
			var ray_target = get_raycast_target(target)
			if ray_target:
				if ray_target.collider.get_node_or_null("Position_zone"):
					_obj.global_position = lerp(_obj.global_position,ray_target.position, 10 * delta)
				
