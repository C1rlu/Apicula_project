extends Node3D

@export var location : location_data
var fl_list : Array
var back_from_subscene : bool = false

func _ready():
	
	location.update_location_state.connect(_back_from_mirror_check)
	update_location_state(false)
	
	fl_list = get_FL(self)

func _back_from_mirror_check():
	update_location_state(true)		
		
func update_location_state(e_fade : bool):
	
	if back_from_subscene:
		return
		
	if location.location_state == game_state.visible_state.normal:
		show()
		enable_all_col(true)
		if e_fade:
			fade()	
			back_from_subscene = true
	if location.location_state == game_state.visible_state.mirror:
		hide()
		enable_all_col(false)
	
		
func enable_all_col(condition : bool):
	
	var all_col = get_collision_shapes_in_subtree(self)	
	
	if all_col:
		for c in all_col:
			c.call_deferred("set_disabled",!condition)

		
func get_collision_shapes_in_subtree(subtree: Node) -> Array:
	
	var collision_shapes = []

	for child in subtree.get_children():
		if child is CollisionShape3D:
			collision_shapes.append(child)
		
		collision_shapes += get_collision_shapes_in_subtree(child)

	return collision_shapes


func get_FL(subtree: Node) -> Array:
	
	var FL_shapes = []

	for child in subtree.get_children():
		if child is MeshInstance3D:
			if child.name == "FL":
				var mat = child.get_surface_override_material(0)
				FL_shapes.append(mat)	
		FL_shapes += get_FL(child)

	return FL_shapes

func fade():
	
	var t
	t = create_tween()
	t.tween_method(_value,1.0,0.0,3.0)

func _value(value : float):
	
	
	for mat in fl_list:
		mat.set_shader_parameter("Opacity",value)
