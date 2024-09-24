extends Area3D

@onready var col = $Col

func _ready():
	
	_global_datas.open_inventory.connect(_active)

	
func _active(condition : bool):
	col.disabled = condition
