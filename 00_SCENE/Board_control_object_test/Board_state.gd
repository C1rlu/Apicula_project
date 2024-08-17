extends Node


@onready var move_state_ui = $"../Move_state_UI"

func _ready():

	_global_datas.switch_state.connect(switch_board_state)
	
func switch_board_state(condition : bool):
	
	if condition:
		_global_datas.board_state = game_state.board_state.Moving_obj
		move_state_ui.visible = true
	else:	
		_global_datas.board_state = game_state.board_state.view_obj
		move_state_ui.visible = false
	
	
