extends Node


@onready var all_windows = $"../All_windows"

func _ready():

	var all_win = all_windows.get_children()

	for w in all_win:
		w.visible = false
		var random_int = randi_range(0,10)	
		if	random_int > 5:
			w.visible = true 
