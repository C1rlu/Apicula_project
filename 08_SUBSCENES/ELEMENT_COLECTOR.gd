extends Node


func _ready():
	_subscene_datas._add_collect_element.connect(_add_element)
	_subscene_datas._remove_collect_element.connect(_remove_element)
	
	
	
func _add_element(element : element_data):
	print(element.element_name, " is on player bag")
	
	_global_datas.element_collected.append(element)
	


func _remove_element(element : element_data):
	print(element.element_name, " is remove from bag")
	
	_global_datas.element_collected.erase(element)


