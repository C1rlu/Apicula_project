extends Node

@onready var elements : Array = get_children()

func _ready():
	_global_datas.active_mirror_switch.connect(_active_mirror_Elements)


func _active_mirror_Elements(condition : bool):
	for element in elements:
		element.visible = condition
		element.get_node("Disable_col")._enable_col(!condition)
		print(condition)
