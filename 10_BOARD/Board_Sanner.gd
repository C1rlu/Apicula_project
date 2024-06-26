extends Node

@onready var scanner = $"../3D_SCENE/SCANNER"



func _ready():	
	_global_datas.open_board_scanner.connect(open_scanner)
	
	
func open_scanner(condition : bool, scanner_data : PackedScene):
	
	scanner.visible = condition
	_global_datas.in_scanner_board_mode = condition
	
	if condition:
		_global_datas._add_back_call.emit(back_call)	
		#
		#var f_position = _global_datas.scanner_position
		#_global_datas.focus_this_on_board.emit(f_position)
		
		
		
func back_call():
	_global_datas.open_board_scanner.emit(false,null)	
