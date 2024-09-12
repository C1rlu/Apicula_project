extends Area3D

@export var col : CollisionShape3D

func _ready():
	_global_datas.open_inventory.connect(_active)
	
	
func _active(condition : bool):
	col.disabled = condition
	
	
	
