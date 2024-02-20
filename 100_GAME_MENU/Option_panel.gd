extends Node

@onready var options = $"../Game_Menu_Root/Options"
@onready var checker_on_vsync = $"../Game_Menu_Root/Options/VBoxContainer/Vsync_button/Checker_off/Checker_on"
@onready var checker_on_fullscreen = $"../Game_Menu_Root/Options/VBoxContainer/Fullscreen_button/Checker_off/Checker_on"

signal open_option

func _ready():
	active_vsync(true)
	
func _on_option_button_pressed():

	open_option.emit()


func go_full_screen(condition : bool):
	
	if condition:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

	checker_on_fullscreen.visible = condition
	
func active_vsync(condition : bool):
	
	if condition:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	
	checker_on_vsync.visible = condition

func _on_fullscreen_button_toggled(toggled_on):
	go_full_screen(toggled_on)


func _on_vsync_button_toggled(toggled_on):
	active_vsync(toggled_on)