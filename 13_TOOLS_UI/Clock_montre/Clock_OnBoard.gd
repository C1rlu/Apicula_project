extends Node

@onready var root_equille = $"../clock_3d/root_equille"

var active : bool = false
func _ready():
	#_global_datas.open_inventory.connect(set_active)	
	pass

func set_active(condition : bool):
	active = condition	
func _process(delta):
	
	
	if !active:
		return
	root_equille.rotation_degrees.y -= 10 * delta
