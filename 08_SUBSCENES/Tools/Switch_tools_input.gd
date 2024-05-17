extends Node


@export var tool_list : Array[tool_data]

var tool_index : int = 0
var enalbe = false

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
		t.cancel_action_signal.emit()
		
	_global_datas._selected_tool = tool	
	
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)

func _input(event):
	
	if !enalbe:
		return
		
	if event.is_action_pressed("Select_next_orbre"):
		switch_active_tool_index(1)	
	if event.is_action_pressed("Select_previous_orbre"):
		switch_active_tool_index(-1)	


	
func switch_active_tool_index(value):
	
	tool_index += value
	
	if tool_index == tool_list.size():
		tool_index = 0
	
	if tool_index == -1:
		tool_index = tool_list.size()-1
		
		
	#SELECT VISUAL TOOLS IN SCENE
	for t in _global_datas.tools_list:
		t.select_this_tool_scene_prefabs.emit(false)
		t.tool_active_signal.emit(false)
	_global_datas._selected_tool = _global_datas.tools_list[tool_index]	
	
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)
