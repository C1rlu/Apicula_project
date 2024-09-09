extends Button



func _ready():
	pressed.connect(_open)	
	
	
func _open():
	_global_datas._open_quest_on_board.emit(false)
	_global_datas._open_letter_quest.emit(true)	
	
