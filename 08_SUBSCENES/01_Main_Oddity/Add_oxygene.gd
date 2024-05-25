extends Node

@onready var oxygene_sphere = $"../Oxygene_sphere"

func add_oxygene(value : float):
	var new_scale = oxygene_sphere.scale.x + value
	oxygene_sphere.scale = Vector3(new_scale,new_scale,new_scale)	
	
	
