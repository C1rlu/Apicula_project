extends Node


func _ready():
	_global_datas.add_collect_element.connect(_add_element)
	_global_datas.open_inventory.connect(_check_element)

func _add_element(element : element_data):
	print(element.element_name, " is collected")
	
	_global_datas.element_collected.append(element)


func _check_element(condition):
	if condition:
		for e in _global_datas.element_collected:
			print(e.element_name)	
