extends Node


@onready var description = $"../ColorRec/description"
@onready var fade = $Fade


func _ready():
	_global_datas.show_board_description.connect(_update_description)

func _update_description(condition : bool, _text : String):
	
	if condition:
		
		description.text = _text	
		fade._fade(true)
		_global_datas._add_back_call.emit(_back_call)
	
	else:
		fade._fade(false)
		

func _back_call():
	_global_datas.show_board_description.emit(false,"")	



