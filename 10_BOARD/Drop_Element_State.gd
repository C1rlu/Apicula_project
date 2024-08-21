extends Node


signal instantiate_on_board(element : element_data)
func _ready():
	_global_datas.check_element_state.connect(check_state)
	
	_global_datas.open_inventory.connect(check_at_open)
	
func _input(event):
	
	if _global_datas.in_open_element_state: 
		if event.is_action_pressed("On_Move"):
			check_next_element()
			
func check_next_element():
	
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			instantiate_on_board.emit(e)
			break		
	_global_datas.in_open_element_state = false
	
	
func check_at_open(condition):
	if condition:
		_global_datas.check_element_state.emit()
	
func check_state():

	if check_if_element_not_on_board():
		_global_datas.back_to_element_state.emit()	
		
	

func check_if_element_not_on_board()-> bool :
	for e in _global_datas.element_collected:
			if !e.Object_on_Board:
				#print(e, " should be put on board")
				_global_datas.in_open_element_state = true
				
				return true
	_global_datas.in_open_element_state = false
	return false
