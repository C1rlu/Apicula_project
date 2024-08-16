extends Node3D

@export var location : location_data

func _ready():
	
	location.back_from_mirror.connect(_back_from_mirror_check)
	update_location_state()

	_global_datas._backFrom_subscene.connect(_back_from_mirror_check)

func _back_from_mirror_check():
	update_location_state()		
		
func update_location_state():
	
	if location.location_state == game_state.visible_state.normal:
		show()	 
		enable_all_col(true)
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



