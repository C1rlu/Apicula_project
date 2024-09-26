extends Node


@export var top_position_collider : CollisionShape3D
@export var top_mesh : Node3D
@export var top_zone_collider : CollisionShape3D
@export var Click_top_col : CollisionShape3D

func _ready():
	_global_datas._close_box.connect(close_box)
	
	
func close_box(condition):
	
	top_position_collider.disabled = !condition
	top_mesh.visible = condition
	top_zone_collider.disabled = !condition
	Click_top_col.disabled = !condition
	_global_datas.box_is_closed = condition
	if condition:
		_global_datas._add_back_call.emit(back_call)

func back_call():
	
	close_box(false)
