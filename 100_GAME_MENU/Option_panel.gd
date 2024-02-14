extends Node

@onready var options = $"../Game_Menu_Root/Options"

signal open_option


func _on_option_button_pressed():

	open_option.emit()


func go_full_screen(condition : bool):
	
	if condition:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func active_vsync(condition : bool):
	
	if condition:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_fullscreen_button_toggled(toggled_on):
	go_full_screen(toggled_on)


func _on_vsync_button_toggled(toggled_on):
	active_vsync(toggled_on)
