extends Node


@export var collider : CollisionShape3D
@export var On_Move : Node
func _ready():
	On_Move.On_Move.connect(_show_map)
	_global_datas.moving_state.connect(move_is_active)
	
func _show_map(condition : bool):
	if condition:
		_global_datas._open_player_map.emit(condition)	
	

func move_is_active(condition : bool):
	collider.disabled = condition
