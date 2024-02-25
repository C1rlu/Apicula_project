extends Node3D

@onready var flag = $Flag
@onready var flag_off = $Flag_OFF


signal show_on_map
var on_map = false
func _ready():
	flag.visible = false
	flag_off.visible = true
	


func _on_epave_zone_see_int(condition):

	if on_map:
		return
		
	if condition:
		flag.visible = true
		flag_off.visible = false
		on_map = true
