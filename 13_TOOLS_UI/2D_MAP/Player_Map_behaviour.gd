extends Node

@export var Map_node : Control
@export var Map_button_tool : tool_data

func _ready():
	_global_datas._open_player_map.connect(_open_map)
	Map_node.visible = false
	
	Map_button_tool.tool_active_signal.connect(_open_map)
	
	
	
func _open_map(condition : bool):
	Map_node.visible = condition	

	if condition:
		_global_datas._add_back_call.emit(back_call)

func back_call():
	_global_datas._open_player_map.emit(false)
