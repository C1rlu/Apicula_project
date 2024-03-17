extends Node


@onready var game_menu_root = $"../Game_Menu_Root"
@onready var focus_button = $"../Game_Menu_Root/HBoxContainer/Resum_Button2"

func _ready():
	_global_datas._open_menu.connect(_open_menu)
	_open_menu(false)
	
	
func _open_menu(condition : bool):
	game_menu_root.visible = condition		
	_global_datas.show_ui_scanner_dots.emit(condition)
	
func _input(event):
	
	if event.is_action_pressed("Open_Menu"):
		_global_datas.Player_InMenu =! _global_datas.Player_InMenu
		_global_datas._open_menu.emit(_global_datas.Player_InMenu)	
		focus_button.grab_focus()
		
		#set back call
		_global_datas._back_call_list.append(set_back_call)	
		get_tree().paused = true
			

func set_back_call():
	_global_datas._open_menu.emit(false)
	_global_datas.Player_InMenu = false
	get_tree().paused = false	
