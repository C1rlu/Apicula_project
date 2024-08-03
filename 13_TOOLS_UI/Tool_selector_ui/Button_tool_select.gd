extends Button

@export var tool : tool_data

func _ready():
	
	connect("button_down",select_this_tool)


func select_this_tool():
	
	_global_datas.set_tool_ui.emit(tool)
	_global_datas.open_tool_selector.emit(false)
