extends Node


@export var BackPath : tool_data
@onready var timer = $Timer

const BACK_PATH_SPOTS = preload("res://08_SUBSCENES/Tools/BackPath/BackPath_spots.tscn")

func _ready():
	BackPath.tool_active_signal.connect(drag_path_target)
		

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

