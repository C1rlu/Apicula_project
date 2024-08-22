extends Node

@export var focus_data : boardCamState_data
@export var On_View : Node
@export var root : Node3D

@export var Collider : CollisionShape3D

func _ready():
	On_View.On_View.connect(on_view)
	_global_datas.moving_state.connect(move_is_active)
	
func on_view():
	
	_global_datas.camera_focus_On.emit(focus_data)	
	_global_datas.focus_this_on_board.emit(root.global_position)
	
func move_is_active(condition : bool):
	Collider.disabled = condition
