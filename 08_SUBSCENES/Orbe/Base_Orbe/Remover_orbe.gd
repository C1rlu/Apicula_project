extends Node
@onready var timer = $"../Timer"

@onready var orbe_base_prefab = $".."

func _on_timer_timeout():
	
	_global_datas._orbe_list.erase(orbe_base_prefab)
	orbe_base_prefab.queue_free()
