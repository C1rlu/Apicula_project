extends Node


@onready var root = $".."


func _ready():
	_global_datas._mirror_switch.connect(_back_from_mirror)	
	
func _back_from_mirror(condition):
	
	if !condition:
		root.queue_free()	
