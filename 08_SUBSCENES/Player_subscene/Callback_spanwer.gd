extends Node


@export var Rg : RigidBody3D
@export var JetPath : tool_data
@export var BackPath : tool_data

@onready var timer = $Timer

const BACK_PATH_SPOTS = preload("res://08_SUBSCENES/Tools/BackPath/BackPath_spots.tscn")

var targer_index : int = 0
var _active : bool = false



func _ready():
	pass	
	#BackPath.tool_active_signal.connect(drag_path_target)
	#_global_datas._go_Subscene.connect(reset)
	#
	#JetPath.tool_active_signal.connect(active)
	
	
func active(condition : bool):
	
	if _global_datas.backcall_path.size() == 0 :
		return 
	targer_index = _global_datas.backcall_path.size()
	
	if condition:
		_active = true
	
	
func reset():
	_global_datas.backcall_path.clear()	
	var dot = BACK_PATH_SPOTS.instantiate()
	_global_datas.LoadScene.add_child(dot)
	var _position = _global_datas.LoadScene.global_position + Vector3(0.0,1.0,0.0)
	dot.global_position = _position
	dot.visible = false
	_global_datas.backcall_path.append(dot)
		
func drag_path_target(condition : bool):
	
	if condition:
		
		if !timer.is_stopped():
			return
		set_dot()
		
		
func set_dot():
	
	timer.start()
	var dot = BACK_PATH_SPOTS.instantiate()
	_global_datas.LoadScene.add_child(dot)
	var player_position = _global_datas.subbscene_playerPosition
	dot.global_position = player_position

	_global_datas.backcall_path.append(dot)

	
func _process(delta):
	
	if !_active:
		return
	back_path(delta)	

	
func back_path(delta):	
	
	if targer_index == 0:
		_active = false	
		return
		
	var target = _global_datas.backcall_path[targer_index-1].global_position
	var distance = _global_datas.subbscene_playerPosition.distance_squared_to(target)
	
	if distance < 0.5:
		_global_datas.backcall_path[targer_index-1].visible = false
		targer_index -= 1
		
	var direction = (target - _global_datas.subbscene_playerPosition).normalized()
	Rg.apply_central_force(direction * 10)
