extends Node

@onready var quest_selector = $".."


func _ready():
	_global_datas._open_quest_on_board.connect(_open)
	_open(false)
	
		
	
func _open(condition : bool):
	quest_selector.visible = condition	
	_global_datas.Player_InMenu = condition
	
	if condition:
		_global_datas._add_back_call.emit(func():_open(false))

	
