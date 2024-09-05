extends Button


var selected_button : Button

func _ready():
	connect("button_down",button_click)
	_global_datas.open_tool_selector.connect(active)
	
	
func active(condition : bool):
	
	disabled = !condition	
	
func button_click():
	selected_button.select_this_tool()

