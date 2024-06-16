extends Node

@export var page_photo_data : PhotoData

@export var state_page_info : Array[Control]

func _ready():
	check_state()
	
func remove_all():
	for info in state_page_info:
		info.visible = false	
	
func check_state():
		
	if !page_photo_data:
		return	
		
	remove_all()
	
	var state_number = page_photo_data.page_information_state
	for i in range(state_number-1):
		if i == state_page_info.size():
			return
		state_page_info[i].visible = true		
	
	#for e in state_page_info:
		#
		#e.visible = true
