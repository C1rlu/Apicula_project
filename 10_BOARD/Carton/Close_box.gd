extends Node


@export var top_collider : CollisionShape3D
@export var top_mesh : Node3D


func _ready():
	_global_datas._close_box.connect(close_box)
	
	
func close_box(condition):
	
	top_collider.disabled = !condition
	top_mesh.visible = condition
