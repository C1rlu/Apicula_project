extends Node

@onready var checker_on_vsync = $"../Game_Menu_Root/MainMenu_Box/Options/VBoxContainer/Vsync_button/Checker_off/Checker_on"
@onready var checker_on_fullscreen = $"../Game_Menu_Root/MainMenu_Box/Options/VBoxContainer/Fullscreen_button/Checker_off/Checker_on"


func _ready():
	active_vsync(true)
	checker_on_vsync.visible = true


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

func active_dither(condition : bool):
	
	RenderingServer.global_shader_parameter_set("active_Dither",condition)

func _on_fullscreen_button_toggled(toggled_on):
	go_full_screen(toggled_on)


func _on_vsync_button_toggled(toggled_on):
	active_vsync(toggled_on)
	
func _on_active_dither_button_toggled(toggled_on):
	active_dither(toggled_on)



