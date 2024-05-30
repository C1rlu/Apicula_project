extends _effect
class_name add_scale

@export var scale_amnout : float 

func trigger_effect() -> void:
	
	#print("CHANGE SCALE")
	var oxygene_node = _global_datas.Main_oddity_node.get_node_or_null("Add_oxygene")
	oxygene_node.add_oxygene(scale_amnout)

