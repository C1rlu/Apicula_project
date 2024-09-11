extends Node

@onready var front_element = $"../Front_element"
const BACK_LETTER = preload("res://13_TOOLS_UI/Quest_Selection/Back_Letters/BackResult_Letter.tscn")


func _ready():
	_global_datas._back_letter.connect(_back_letter)
	
func _back_letter():
	
	var back_letter = BACK_LETTER.instantiate()
	front_element.add_child(back_letter)
	_global_datas.Player_InMenu = true
	
