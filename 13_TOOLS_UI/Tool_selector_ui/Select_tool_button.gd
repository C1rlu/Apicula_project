extends Node

@onready var _show_ui = $"../Center"

@onready var button_focus = $"../Center/Button4"

func _ready():
	_global_datas.open_tool_selector.connect(show_ui)
	_global_datas._backFrom_subscene.connect(hide)

func _input(event):
	
	if  !_global_datas.Player_InSubScene:
		return
	
	if event.is_action_pressed("open_tool_selector"):
		_global_datas.open_tool_selector.emit(true)
		
	
func hide():
	show_ui(false)	
		
func show_ui(condition : bool):
	
	_global_datas.player_in_selector = condition
	_global_datas._selected_tool.tool_active_signal.emit(false)	
	_show_ui.visible = condition
	
	if condition:
		button_focus.grab_focus()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
