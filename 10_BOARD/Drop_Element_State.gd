extends Node


signal instantiate_on_board(element : element_data)
func _ready():
	_global_datas.check_element_to_open.connect(check_next_element)
	_global_datas.open_inventory.connect(check_at_open)
	
func _input(event):
	
	if _global_datas.in_open_element_state: 
		if event.is_action_pressed("On_Move"):
			check_next_element()
			
func check_next_element():
	
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			instantiate_on_board.emit(e)
			print(e.element_name, "is ready to be BREAK")
			break		
	
func check_at_open(condition):
	if condition:
		_global_datas.check_element_to_open.emit()
	



