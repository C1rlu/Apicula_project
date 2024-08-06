extends Node

@onready var collision_shape_3d = $"../ZoneCollide/CollisionShape3D"
@onready var magnet_zone = $"../Magnet_zone/CollisionShape3D"


func _ready():
	_global_datas.open_inventory.connect(active)
	
func active(condition):
	collision_shape_3d.disabled = condition	
	magnet_zone.disabled = condition
