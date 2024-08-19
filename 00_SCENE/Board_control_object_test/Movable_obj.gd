extends Node

@export var collider : CollisionShape3D
@export  var limit_zone : CollisionShape3D

@export var move_root : Node3D
@export var rotation_root : Node3D

@export var On_Move : Node
@export var On_View: Node



@export var Render : MeshInstance3D
var Normal_material : Material
@export var moving_material : Material
@export var overlaping_object : Material

var rotating : bool
func _ready():
	_global_datas.switch_state.connect(move_is_active)
	
	On_Move.On_Move.connect(_On_move)
	On_Move._move.connect(_on_move)
	On_Move._rotate.connect(_on_rotate)
	#On_View.On_View.connect(_on_view)
	
	if Render:
		Normal_material = Render.get_surface_override_material(0)
	
func move_is_active(condition : bool):
	collider.disabled = condition

func _On_move(condition):
	
	collider.disabled = condition
	

	if condition:
		_global_datas.select_movable_object.emit(On_Move)
		if Render:
			Render.set_surface_override_material(0,moving_material)
	else:
		_global_datas.select_movable_object.emit(null)
		if Render:
			Render.set_surface_override_material(0,Normal_material)
	
func _on_view():
	print("ON VIEW OBJECT")

func _on_move(target, speed, delta):
	
	#check_limit()
	move_root.global_position = lerp(move_root.global_position,target,speed * delta)		

func _on_rotate(direction):	

	if rotating:
		return
		
	var t
	if t:
		t.kill()
		
	if direction == 1:
		var target_rotation = rotation_root.rotation_degrees.y + 45.0
		rotating = true
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
	if direction == -1:
		var target_rotation = rotation_root.rotation_degrees.y - 45.0
		rotating = true
		t = create_tween()
		t.tween_property(rotation_root,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		
func done():
	rotating = false
func check_limit() -> bool:
	
	var areas = limit_zone.get_overlapping_areas()
	if areas:
		for a in areas:
			var limit = a.get_node_or_null("Limit")	
			if limit:
				_global_datas.limit_zone = true
				Render.set_surface_override_material(0,overlaping_object)
				return true
	_global_datas.limit_zone = false			
	Render.set_surface_override_material(0,moving_material)
	return false



