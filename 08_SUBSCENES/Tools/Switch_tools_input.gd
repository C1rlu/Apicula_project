extends Node
@export var all_tool: Array[tool_data]
var tool_index : int = 0 

func _ready():	
	_global_datas._start_ini_subscene.connect(ini_sub)
	ini_sub()	
	
	
func ini_sub():
	switch_active_tool(all_tool[tool_index])		
		
func _input(event):
	

	if !_global_datas.Player_InSubScene:
		return
	
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_In_Inventory:
		return
	
	if event.is_action_pressed("Select_next_orbre"):
		select_next_tool()
		
	if event.is_action_released("Select_previous_orbre"):
		select_previous_tool()
	
	
func select_next_tool():
	print("next")
	if tool_index == all_tool.size()-1:
		tool_index = 0	
	else:	
		tool_index +=1
	var selected_tool = all_tool[tool_index] 
	switch_active_tool(selected_tool)
	disable_all_tool()		
func select_previous_tool():
	print("previous")	
	if tool_index == -1 :
		tool_index = all_tool.size()-1
	else:
		tool_index -= 1	
		
	var selected_tool = all_tool[tool_index] 
	switch_active_tool(selected_tool)
	disable_all_tool()

func disable_all_tool():
	for t in all_tool:
		t.tool_active_signal.emit(false)	
	
				
func switch_active_tool(tool : tool_data):

	#SELECT VISUAL TOOLS IN SCENE
	for t in all_tool:
		t.select_this_tool_scene_prefabs.emit(false)
		t.cancel_action_signal.emit()
		
	_global_datas._selected_tool = tool	
	
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)
