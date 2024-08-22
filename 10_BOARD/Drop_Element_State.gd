extends Node

@export var camera_focus : boardCamState_data
signal instantiate_on_board(element : element_data)
var current_element_broke : element_data

func _ready():
	_global_datas.check_element_to_open.connect(check_next_element)
	_global_datas.open_inventory.connect(check_at_open)
	
			
func check_next_element():
	
	if !check_if_element():
		#print("NO ELEMENT TO BROKE")
		return
	_global_datas.go_to_element_to_open.emit()
	#_global_datas.camera_focus_On.emit(camera_focus)
	if current_element_broke:
		if !current_element_broke.Object_broke:
			return
		if !current_element_broke.Object_on_Board:
			return
			
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			instantiate_on_board.emit(e)
			e.Object_on_Board = false
			e.Object_broke = false
			current_element_broke = e 
			print(e.element_name, "is ready to be BREAK")
			break		
	
func check_at_open(condition):
	if condition:
		_global_datas.check_element_to_open.emit()
	

func check_if_element()-> bool :
	 
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			return true	
	return false
