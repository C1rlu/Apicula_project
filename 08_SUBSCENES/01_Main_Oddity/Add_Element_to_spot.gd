extends Node


func _ready():
	_global_datas.add_element_to_main_Oddity.connect(add_element)
	
	
func add_element(element : PackedScene):
	var max_spot = _global_datas.Main_oddity_positions_data.size()-1
	var random_spot_index = randi_range(0,max_spot) 
	print("Add ", element)
	var new_element = element.instantiate()
	_global_datas.Main_oddity_positions_data[random_spot_index].Position.add_child(new_element)
