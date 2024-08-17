extends Node3D

@export var collider : CollisionShape3D


func _on_on_click_on_position(Position):
	global_position = Position
	
func _on_on_click_on_move(condition):
	if condition:
		_global_datas.select_movable_object.emit(self)
	collider.disabled = condition
