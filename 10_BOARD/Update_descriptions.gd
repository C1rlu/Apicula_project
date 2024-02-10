extends Node


@onready var description = $"../ColorRec/description"
@onready var fade = $Fade


func _ready():
	_global_datas.show_board_description.connect(_update_description)

func _update_description(condition : bool, _text : String):
	
	if condition:
		
		description.text = _text	
		fade._fade(true)
	else:
		fade._fade(false)
