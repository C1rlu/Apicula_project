extends Node


func mouse_enable(condition):
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else :
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
