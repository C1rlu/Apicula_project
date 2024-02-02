extends Node
@onready var text_size = $"../text_size"
@onready var text_on = $"../text_size/ColorRect/text_on"
@onready var from = $"../text_size/name"


func set_note(note : String, _from : String):
	
	text_size.text = note
	text_on.text = note	
	from.text = _from
