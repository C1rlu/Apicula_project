extends Node


@export var tool_clock: tool_data

@export var Oygene_area : Area3D

func _ready():
	
	Oygene_area.area_entered.connect(area_entered)
	Oygene_area.area_exited.connect(area_exited)
func area_entered(area):
	
	if area:
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			tool_clock.tool_active_signal.emit(true)	
		

func area_exited(area):
	

	if area:
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			tool_clock.tool_active_signal.emit(false)	
		
