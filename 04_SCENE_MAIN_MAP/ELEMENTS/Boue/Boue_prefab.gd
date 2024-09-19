extends Node3D

@onready var boue_prefab = $"."
@onready var collision_shape_3d = $StaticBody3D/CollisionShape3D

func _ready():
	_disable_boue()
	
func _disable_boue():
	boue_prefab.visible = false	
	collision_shape_3d.disabled = true
	
func _active_boue():
	boue_prefab.visible = true	
	collision_shape_3d.disabled = false
	
