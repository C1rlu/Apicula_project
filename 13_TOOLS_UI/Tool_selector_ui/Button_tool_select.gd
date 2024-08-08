
extends Button

@export var tool : tool_data

func _ready():
	
	connect("button_down",select_this_tool)
	$img.texture = tool.ui_img
	tool.selector_button = self
	
func select_this_tool():
	
	_global_datas.set_tool_ui.emit(tool)


