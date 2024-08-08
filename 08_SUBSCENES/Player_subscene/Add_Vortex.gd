extends Node


@export var vortex_tool : tool_data
const TELEPORTER_PREFAB = preload("res://08_SUBSCENES/Oddity/Teleporter/Teleporter_prefab.tscn")

func _ready():
	vortex_tool.tool_active_signal.connect(add_vortex)
	
func add_vortex(condition : bool):
	
	if condition:
		set_vortex()	
		disable()
func set_vortex():
	
	var teleporter = TELEPORTER_PREFAB.instantiate()
	_global_datas.LoadScene.add_child(teleporter)
	var player_position = _global_datas.subbscene_playerPosition
	teleporter.global_position = player_position

func disable():
	vortex_tool.selector_button.visible = false
	_global_datas.update_selector.emit()
