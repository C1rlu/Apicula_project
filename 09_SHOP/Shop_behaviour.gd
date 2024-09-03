extends Node


signal open_this_shop(selected_shop : Control)

@export var shops : Array[Control]


func _ready():
	open_this_shop.connect(open_shop)


func open_shop(selected_shop : Control):
	
	for s in shops:
		s.visible = false
		
	selected_shop.visible = true
