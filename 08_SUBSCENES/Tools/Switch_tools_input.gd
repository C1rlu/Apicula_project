extends Node


@export var tool_list : Array[tool_data]



func _ready():
	
	_global_datas.tools_list = tool_list
	_global_datas.switching_tool.connect(switch_active_tool)
	_global_datas._go_Subscene.connect(_select_only_light)
	
func _select_only_light():
	
	switch_active_tool(tool_list[0])
	
func switch_active_tool(tool : tool_data):
	
	#SELECT VISUAL TOOLS IN SCENE
	for t in _global_datas.tools_list:
		t.select_this_tool_scene_prefabs.emit(false)
		
	_global_datas._selected_tool = tool	
	
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)

