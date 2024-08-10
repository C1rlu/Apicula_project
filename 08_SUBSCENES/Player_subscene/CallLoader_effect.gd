extends Node

@export var caller_tool : tool_data
@export var tool_clock: tool_data
const LOADER_PREFABSCN = preload("res://08_SUBSCENES/Tools/Loader/Loader_prefabscn.tscn")

func _ready():
	caller_tool.tool_active_signal.connect(call_loader)
	
func call_loader(condition : bool):
	
	if condition:
		disable()
		set_loader()
	
func set_loader():
	
	var Oxy_loader = LOADER_PREFABSCN.instantiate()
	_global_datas.LoadScene.add_child(Oxy_loader)
	var player_position = _global_datas.subbscene_playerPosition
	Oxy_loader.move_to(player_position) 

func disable():
	caller_tool.selector_button.visible = false
	_global_datas.update_selector.emit()



func _on_zone_collide_area_entered(area):
	
	if area:
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			tool_clock.tool_active_signal.emit(true)	


func _on_zone_collide_area_exited(area):
	
	if area:
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			tool_clock.tool_active_signal.emit(false)	
