extends Node

@export var element : element_data
@export var collider : CollisionShape3D
@export  var limit_zone : Area3D

@export var move_root : Node3D
@export var rotation_root : Node3D

@export var On_Move : Node
@export var r_rotation_degrees : float = 45.0

@export var is_a_letter : bool = false
@export var can_be_delevery : bool = true

signal select_render_state(index_state : int)

var rotating : bool
var click_raycast_position : Vector3
var move_offset : Vector3

func _ready():
	_global_datas.moving_state.connect(move_is_active)
	
	if On_Move:
		On_Move.On_Move.connect(_On_move)
		On_Move._move.connect(_on_move)
		
		if rotation_root:
			On_Move._rotate.connect(_on_rotate)



func move_is_active(condition : bool):
	collider.disabled = condition

func _On_move(condition):
	

	if _global_datas.limit_zone: # cant clic if object overlap another limit zone ( so an object )
		return
	
	
	
	
	collider.disabled = condition

	if condition:
		_global_datas.moving_state.emit(true)
		
		#here to set the offset
		var utility = GameUtility.new()
		var ray_target 
		if _global_datas.player_using_pad:
			ray_target = _global_datas.pad_center_ui.position
		else: 
			ray_target = get_viewport().get_mouse_position() 	
		var raycast = utility.get_raycast_target(ray_target,_global_datas.board_camera)
		if raycast:
			#print("Raycast hit ", raycast.position)
			move_offset = move_root.position - raycast.position
		_global_datas.select_movable_object.emit(On_Move)
		
		select_render_state.emit(1) # moving material
		
		
	else:
		
		_check_if_in_carton()
		
		_global_datas.moving_state.emit(false)
		_global_datas.select_movable_object.emit(null)
		select_render_state.emit(0) # normal material
		
		if element:
			if !element.Object_on_Board:
				element.Object_on_Board = true	
				_global_datas.check_element_to_open.emit()

func _check_if_in_carton():
	
	if can_be_delevery:	
		for e in limit_zone.get_overlapping_areas():
			var carton = e.get_node_or_null("Carton")
			if carton:
				#print("Object in carton")
				_global_datas._check_deliver.emit(element)
				return	
	
	if is_a_letter:
		for e in limit_zone.get_overlapping_areas():
			var carton_top = e.get_node_or_null("Carton_top")
			if carton_top:
				print("letter top")
				
				#_global_datas._deliver_inbox_element.emit()
				#queue_free()
				return	
	
	
		
	
func _on_move(target, speed, delta):
	
	check_limit(target)
	move_root.global_position = target.position + Vector3(move_offset.x,0.0,move_offset.z)

func _on_rotate(direction):	

	if rotating:
		return
		
	var t
	if t:
		t.kill()
		
	if direction == 1:
		var target_rotation = rotation_root.rotation_degrees.y - r_rotation_degrees
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		rotating = true
	if direction == -1:
		var target_rotation = rotation_root.rotation_degrees.y + r_rotation_degrees
		rotating = true
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		
func done():
	rotating = false
	

	
func check_limit(raycast_result)-> bool:
	
	if !limit_zone:
		return false

	var areas = limit_zone.get_overlapping_areas()
	if areas:
		for a in areas:
			var limit = a.get_node_or_null("Limit")	
			if limit:
				_global_datas.limit_zone = true
				select_render_state.emit(2)
				return true
	
	if raycast_result.normal != Vector3(0.0,1.0,0.0):
		_global_datas.limit_zone = true
		select_render_state.emit(2)
		return true
	
	_global_datas.limit_zone = false
	select_render_state.emit(1)
	return false
	

