extends Button


func _ready():
	pressed.connect(_open_quest_selector)
	
	
func _open_quest_selector():
	_global_datas._open_quest_on_board.emit(true)
