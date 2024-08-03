extends Node
@export var all_tool: Array[tool_data]

func _ready():	
	
	_global_datas._selected_tool = all_tool[0]
	_global_datas.set_tool_ui.connect(select_this)
	
	_global_datas._go_Subscene.connect(_reset)
	
func _reset():
	
	_global_datas.set_tool_ui.emit(_global_datas._selected_tool)

			
func select_this(tool : tool_data):
	
	if tool:
		switch_active_tool(tool)		
	
#func disable_all()			
func switch_active_tool(tool : tool_data):

	#SELECT VISUAL TOOLS IN SCENE
	for t in all_tool:
		t.select_this_tool_scene_prefabs.emit(false)
		t.cancel_action_signal.emit()
		t.tool_active_signal.emit(false)
		
	_global_datas._selected_tool = tool	
	
	_global_datas._selected_tool.select_this_tool_scene_prefabs.emit(true)
	_global_datas._selected_tool.tool_active_signal.emit(false)
