extends Node

@onready var quest_selector = $".."


func _ready():
	_global_datas._open_quest_on_board.connect(_open)
	
	_open(false)
	

	
func _open(condition : bool):
	quest_selector.visible = condition	
	_global_datas.Player_InMenu = condition
	if condition:
		_global_datas._add_back_call.emit(back_call)
		
	
	var utility : GameUtility = GameUtility.new()
	var n_timer : Timer = utility.create_timer(0.1,done,self)
	n_timer.start()
	
func done():
	_global_datas._show_object_legend.emit(false,"null")
		
func back_call():
	_global_datas._open_quest_on_board.emit(false)	
	
