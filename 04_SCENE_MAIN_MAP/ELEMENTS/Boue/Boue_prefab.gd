extends Node3D


@onready var collision_shape_3d = $StaticBody3D/CollisionShape3D
@onready var collision_shape_3d_col = $Area3D/CollisionShape3D


func _ready():
	_disable_boue()
	
func _disable_boue():
	visible = false	
	collision_shape_3d.disabled = true
	collision_shape_3d_col.disabled = true
func _active_boue():
	visible = true	
	collision_shape_3d.disabled = false
	collision_shape_3d_col.disabled = false
