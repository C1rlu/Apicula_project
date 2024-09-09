extends Node

@onready var letters_ui = $".."

func _ready():
	pass
	#_global_datas.open_inventory.connect(_active)
	
	#_global_datas._open_quest_on_board.connect(_check)
	#_global_datas._in_select_element_state.connect(_check)
	
	
func _active(condition : bool):
	letters_ui.visible = condition	

func _check(condition :bool):
	if _global_datas._in_selection_state:
		return
	letters_ui.visible = !condition	
		

