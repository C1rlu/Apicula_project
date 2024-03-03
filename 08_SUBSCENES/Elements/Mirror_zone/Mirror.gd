extends Node

@onready var mirror_prefabs = $".."

func _ready():
	
	_global_datas._click_mirror_switch.connect(remove_mirror)



func remove_mirror(condition: bool):
	if condition:
		mirror_prefabs.queue_free()	
