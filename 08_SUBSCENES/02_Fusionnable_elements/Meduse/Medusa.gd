extends Node

@onready var root = $".."
@export var oddity_prefab : PackedScene


func _on_fusion_fusion_result():
	var on_position = root.position
	_global_datas.instance_scene_oddity.emit(oddity_prefab,1,on_position)
	
	root.queue_free()
