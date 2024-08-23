extends Node

@export var camera_state : boardCamState_data

@export var collider : CollisionShape3D
@export var On_View : Node
@export var root : Node3D
func _ready():
	On_View.On_View.connect(Show_Map)
	_global_datas.moving_state.connect(move_is_active)
	
func Show_Map():
	print("SHOW MAP STATE")
	_global_datas.camera_focus_On.emit(camera_state)
	_global_datas.focus_this_on_board.emit(root.global_position)
func move_is_active(condition : bool):


	collider.disabled = condition
	
