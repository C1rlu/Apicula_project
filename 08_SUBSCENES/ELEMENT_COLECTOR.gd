extends Node

@export var collector_area : Area3D
@export var attache_node : Node3D
var element_inventory_slot : Array[Node3D]


func _ready():
	
	if collector_area:
		collector_area.area_entered.connect(on_area_enter)
	
	if attache_node:
		element_inventory_slot.append_array(attache_node.get_children())
			
func on_area_enter(area):
	
	
	
	if area:
		var element = area.get_node_or_null("Element")
		if element:
			element._collect.emit()
			update_render_amount()

func update_render_amount():
	
	var size = _global_datas.element_collected.size()
	
	for i in range(element_inventory_slot.size()):
			if i < size:
				element_inventory_slot[i].visible = true
			else:
				element_inventory_slot[i].visible = false
