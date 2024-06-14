extends Node


@export var button_data : book_button_data

func _ready():
	
	button_data.button_area = $".."

func push():
	
	button_data.button_signal.emit()
	
func on_over(condition : bool):
	button_data.button_on_over.emit(condition)	

