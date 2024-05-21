extends Node

@onready var meduse_species_prefab = $".."
@export var oddity_prefab : PackedScene


func _on_fusion_fusion_result():
	var on_position = meduse_species_prefab.position
	_global_datas.instance_scene_oddity.emit(oddity_prefab,1,on_position)
