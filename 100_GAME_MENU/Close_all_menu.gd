extends Node


@export var all_menu : Array[Control]

func _close_all(index : int):
	
	for m in all_menu:
		m.visible = false	
		
	all_menu[index].visible = true

func _on_option_panel_open_option():
	_close_all(1)


func _on_restart_restart():
	_close_all(0)
