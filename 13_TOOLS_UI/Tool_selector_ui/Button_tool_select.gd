extends Button

@export var tool : tool_data

func _ready():
	
	if tool:
		connect("button_down",select_this_tool)
		connect("focus_entered",select_this)
		$img.texture = tool.ui_img
		tool.selector_button = self
	
func select_this_tool():
	
	_global_datas.set_tool_ui.emit(tool)
	#_global_datas.open_tool_selector.emit(false)

func select_this():	
	_global_datas.set_tool_ui.emit(tool)
	
func _run():
	if tool:
		$img.texture = tool.ui_img	
	
