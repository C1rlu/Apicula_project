extends Node

@export var Teleporter : Node
@onready var main_rapatrier = $"../.."
@export var area : Area3D
var t
@onready var vortex_part = $"../../Vortex_part"

func _active_vortex(condition: bool):
	
	print("active vortex  ", condition)
	
	if t:
		t.kill()
	if condition:
		t = create_tween()
		t.tween_method(_value,0,1,1)
		t.connect("finished", done)
		
				
func done():
	Teleporter._teleport()	
	
func check_zone() -> bool :
	
	var areas = area.get_overlapping_areas()
	for a in areas:
		var vortex_limit = a.get_node_or_null("vortex_limit")	
		if vortex_limit:
			return true
	return false

func _value(value: float):
	vortex_part.amount_ratio = 1 - value
