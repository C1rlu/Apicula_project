extends Button



func _ready():
	pressed.connect(_open)	
	_global_datas._open_quest_on_board.connect(_active)
	
func _open():
	_global_datas._open_quest_on_board.emit(false)
	_global_datas._open_letter_quest.emit(true)	
	
func _active(condition):
	
	disabled = true	
	var Utility = GameUtility.new()
	var n_timer = Utility.create_timer(0.1,func(): disabled = false,self)
	n_timer.start()
