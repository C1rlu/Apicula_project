extends Node


@onready var game_menu_root = $"../Game_Menu_Root"
@onready var focus_button = $"../Game_Menu_Root/HBoxContainer/Resum_Button2"

func _ready():
	_global_datas._open_menu.connect(_open_menu)
	_open_menu(false)
	
func _open_menu(condition : bool):
	game_menu_root.visible = condition		

func _input(event):
	
	if event.is_action_pressed("Open_Menu"):
		_global_datas.Player_InMenu =! _global_datas.Player_InMenu
		_global_datas._open_menu.emit(_global_datas.Player_InMenu)	
		_global_datas.Open_ui_dark_backdrop.emit(_global_datas.Player_InMenu)
		focus_button.grab_focus()
	if _global_datas.Player_InMenu:
		if event.is_action_pressed("Back_call"):
			_global_datas.Player_InMenu = false
			_global_datas._open_menu.emit(_global_datas.Player_InMenu)	
			_global_datas.Open_ui_dark_backdrop.emit(_global_datas.Player_InMenu)
