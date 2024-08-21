extends Node

@export var collector_area : Area3D

func _ready():
	collector_area.area_entered.connect(on_area_enter)
	
func on_area_enter(area):
	
	if area:
		var element = area.get_node_or_null("Element")
		if element:
			element._collect.emit()
			
