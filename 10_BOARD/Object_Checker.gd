extends Node


@export var Area : Area3D
@export var Col : CollisionShape3D

func _ready():
	_global_datas._check_objectZone_Area = Area
	#_global_datas.moving_state.connect(move_is_active)
	_global_datas._check_objectZone_col = Col
#func move_is_active(condition : bool):
	#Col.disabled = condition
