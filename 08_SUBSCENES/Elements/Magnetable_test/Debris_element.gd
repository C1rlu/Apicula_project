extends RigidBody3D


@export var _element_data : element_data
@export var Element : Node


func _ready():
	Element._collect.connect(collect_element)
	
	
func collect_element():
	
	_global_datas.add_collect_element.emit(_element_data)
	queue_free()


