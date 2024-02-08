extends Node

@onready var description = $"../ColorRect2/description"
@onready var color_rect_2 = $"../ColorRect2"


func _ready():
	_global_datas.show_board_description.connect(_update_description)

func _update_description(condition : bool, _text : String):
	
	color_rect_2.visible = condition
	if condition:
		description.text = _text	
	
