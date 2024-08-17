extends Node3D


var previous_position : Vector3
func _ready():
	previous_position = global_position
	


func _on_on_click_on_click():
	print("ON MOVE OBJECT")


func _on_on_click_on_position(Position):
	global_position = Position
