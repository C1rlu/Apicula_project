extends Node

@export var page_photo_data : PhotoData

@export var state_page_info : Array[Control]

func _ready():
	check_state(null)
	_global_datas.focus_this_on_board.connect(check_state)
	
func remove_all():
	for info in state_page_info:
		info.visible = false	
	
func check_state(pos):
		
	if !page_photo_data:
		return	
		
	remove_all()
	
	var state_number = page_photo_data.page_information_state
	for i in range(state_number):
		if i >= state_page_info.size():
			return
		state_page_info[i].visible = true		
	


func _on_page_02_visibility_changed():
	check_state(null)
