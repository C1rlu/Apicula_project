extends Node


@export var _Oddity_data : Oddity_data
@onready var root = $".."

	

func _on_register():
	_global_datas.add_oddity_to_inventory.emit(_Oddity_data)	


func _on_movable_oddity_example_kill():
	_global_datas.remove_oddity_to_inventory.emit(_Oddity_data)	
	root.queue_free()
