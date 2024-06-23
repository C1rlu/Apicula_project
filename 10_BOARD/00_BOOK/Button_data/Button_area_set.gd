extends Node


@export var button_data : book_button_data
signal On_click

func _ready():
	
	button_data.button_area = $".."

func on_over(condition : bool):
	button_data.button_on_over.emit(condition)	

func _on_on_click():
	button_data.button_signal.emit()
