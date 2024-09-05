extends Button


func _ready():
	pressed.connect(_select_this)
	
	
func _select_this():
	_global_datas._open_quest_on_board.emit(false)	
	
