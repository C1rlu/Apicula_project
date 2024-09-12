extends Node


@onready var quest_letter = $".."

func _ready():
	
	_global_datas._open_letter_quest.connect(_open_letter)
	_open_letter(false)

func _open_letter(condition : bool):
	quest_letter.visible = condition	
	
	_global_datas.Player_InMenu = condition
	var utility : GameUtility = GameUtility.new()
	var n_timer : Timer = utility.create_timer(0.1,done,self)
	n_timer.start()
	
	if condition:
		_global_datas._add_back_call.emit(back_call)
func done():
	_global_datas._show_object_legend.emit(false,"null")


func back_call():
	_global_datas._open_letter_quest.emit(false)	
	#_global_datas._open_quest_on_board.emit(true)
