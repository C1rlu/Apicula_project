extends Node

@export var click_col : CollisionShape3D

func _ready():
	_global_datas._letter_is_moving.connect(_active)
	
	
	
func _active(condition:bool):
	click_col.disabled = condition	
	


