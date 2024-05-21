extends Fusion_effect
class_name add_scale

@export var scale_amnout : float 

func trigger_fusion() -> void:
	
	print("CHANGE SCALE")
	var new_scale = _global_datas.Main_oddity_node.scale.x + scale_amnout
	_global_datas.Main_oddity_node.scale = Vector3(new_scale,new_scale,new_scale)	
