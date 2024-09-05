extends Node

@onready var _show_ui = $".."


func _ready():
	_global_datas.open_tool_selector.connect(show_ui)
	_global_datas._backFrom_subscene.connect(hide)
	show_ui(false)	
		
func hide():
	show_ui(false)	

func show_ui(condition : bool):
	
	#get_tree().paused = condition
	_show_ui.visible = condition
	_global_datas.selector_is_open = condition
	
	if condition:
		Engine.time_scale = 0.1
	else:
		Engine.time_scale = 1.0	
		
