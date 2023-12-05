extends Node3D

@export var offset : Vector3
@export var division_scale : float = 28.0
func _ready():
	_global_datas._open_board.connect(_updade_playerMapPosition)

func _updade_playerMapPosition():
	
	var x = _global_datas.player_position.x /division_scale+ offset.x
	var z = _global_datas.player_position.z /division_scale + offset.z
	
	var PlayerMapPosition = Vector3(x,0.048,z)

	
	position = PlayerMapPosition
	
	
