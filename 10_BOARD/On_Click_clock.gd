extends Node


signal On_click
var active : bool = false 

#@onready var root_equille = $"../../clock_3d/root_equille"


#func _on_on_click():
	#active = true	
	#print("CLOCK")
#
#func _process(delta):
	#
	#if !active:
		#return
	#root_equille.rotation_degrees.y -= 10 * delta
