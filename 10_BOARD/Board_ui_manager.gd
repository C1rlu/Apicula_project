extends Node

func _ready():
	_global_datas._open_board.connect(_openboard)


func _input(event: InputEvent) -> void:
	
	
	if _global_datas.Player_InBoard:
		return
	if _global_datas.Player_InMenu:
		return
	if _global_datas.Player_InDialogue:
		return	
		
	if _global_datas.Player_InSubScene == true:
		return		
	if event.is_action_pressed("Open_map"):
		_global_datas._open_board.emit()
	
		
func _openboard():
	
	
	
	_global_datas.Player_InBoard = !_global_datas.Player_InBoard
	$"../../04_BOARD/BOARD_UI".visible = _global_datas.Player_InBoard
	
	_global_datas._call_back.connect(_closeBoard)
	
func _closeBoard():
	_global_datas.Player_InBoard = false

	$"../../04_BOARD/BOARD_UI".visible = _global_datas.Player_InBoard
	_global_datas._call_back.disconnect(_closeBoard)
	_global_datas._close_board.emit()
	
