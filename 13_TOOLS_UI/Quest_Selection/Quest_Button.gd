extends Button


@export var quest_data : Note_Data

func _ready():
	pressed.connect(_select_this)
	
	
func _select_this():
	_global_datas._open_quest_on_board.emit(false)	
	_global_datas._select_quest_on_board.emit(quest_data)
