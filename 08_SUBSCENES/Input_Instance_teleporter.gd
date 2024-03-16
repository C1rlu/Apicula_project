extends Node

@export var teleporter_data : tool_data

func _ready():
	teleporter_data.tool_active_signal.connect(_play_tool)		
	
func _play_tool(condition : bool):
	
	if _global_datas.Player_InMirrorScene:
		return
	
	if !condition:
		return
		
	_global_datas._instance_teleporter.emit()
			

	



