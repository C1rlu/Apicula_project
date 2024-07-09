extends _effect
class_name add_scale

@export var scale_amnout : float 

func trigger_effect(element) -> void:
	
	print("CHANGE SCALE")
	element.scale += Vector3(scale_amnout,scale_amnout,scale_amnout) 

