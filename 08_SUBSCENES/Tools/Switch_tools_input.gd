extends Node


@export var tool_list : Array[tool_data]

var index : int

func _ready():
	
	_global_datas.tools_list = tool_list
	index = 0
	_global_datas._selected_tool = _global_datas.tools_list[index]

	update_active_tool()
	
	_global_datas._go_Subscene.connect(update_active_tool)
	
	
func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if event.is_action_pressed("Equip_Next_Tool"):
		select_next_tool()
	

func select_next_tool():
	
	index +=1
	
	if index > _global_datas.tools_list.size()-1:
		index = 0	
	
	#SELECT ACTIVE TOOL SIGNAL	
	_global_datas._selected_tool = _global_datas.tools_list[index]
	
	update_active_tool()
	#print(_global_datas._selected_tool.Tool_Name, " is selected")
	

func update_active_tool():
	
	#SELECT VISUAL TOOLS IN SCENE
	for t in _global_datas.tools_list:
		t.select_this_tool_scene_prefabs.emit(false)
		
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)
