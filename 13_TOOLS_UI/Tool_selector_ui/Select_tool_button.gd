extends Node

@onready var _show_ui = $"../Center"

signal _fade(condition : bool)

func _ready():
	_global_datas.open_tool_selector.connect(show_ui)
	_global_datas._backFrom_subscene.connect(hide)
		
func hide():
	show_ui(false)	

func show_ui(condition : bool):
	
	get_tree().paused = condition
	_show_ui.visible = condition
	_fade.emit(condition)
		

