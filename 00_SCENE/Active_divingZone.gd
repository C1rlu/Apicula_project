extends Node
@onready var root = $"../--DECOR--/DIVING_ZONE"
@export var active_at_start : bool = true
var all_zone

func _ready():
	all_zone = root.get_children()
	disable_all()
	
	_global_datas.active_diving.connect(active_all)
	
	if active_at_start:
		active_all()	
	
func active_all():
	
	for e in all_zone:
		e.active()
		
		
func disable_all():
	
	for e in all_zone:
		e.disable()
