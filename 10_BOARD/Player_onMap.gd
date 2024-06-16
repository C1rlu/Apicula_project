extends Node3D

@export var offset : Vector3
@export var division_scale : float = 28.0
@onready var cam_target = $"../CamTarget"



func _ready():
	_global_datas.open_inventory.connect(_updade_playerMapPosition)


func _focus_player_when_open(condition: bool):
	
	if !condition:
		var this_position = global_position
		_global_datas.focus_this_on_board.emit(this_position)	
	
	
func _updade_playerMapPosition(condition : bool):
	if !condition:
		return
	var x = _global_datas.player_position.x /division_scale + offset.x
	var z = _global_datas.player_position.z /division_scale + offset.z
	
	var PlayerMapPosition = Vector3(x,0.009,z)

	rotation = _global_datas.player_boat_rotation
	position = PlayerMapPosition
	

