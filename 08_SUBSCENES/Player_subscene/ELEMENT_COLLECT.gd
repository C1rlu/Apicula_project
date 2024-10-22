extends Node

@export var collector_area : Area3D

@export var active : bool
func _ready():
	
	if !active:
		return
	_subscene_datas._add_collect_element.connect(_add_element)
	
	collector_area.area_entered.connect(on_area_enter)
	
	
func _add_element(element : element_data):
	print(element.element_name, " is collected")
	
	_global_datas.element_collected.append(element)



func on_area_enter(area):

	if area:
		var element = area.get_node_or_null("Element")
		if element:
			element._collect.emit()

		

			

