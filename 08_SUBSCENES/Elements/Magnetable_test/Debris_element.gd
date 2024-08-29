extends RigidBody3D


@export var _element_data : element_data
@export var Element : Node

@onready var collision_shape_3d = $CollisionShape3D


@export var Debris : Node
func _ready():
	Element._collect.connect(collect_element)
	
	Debris.freeze_body.connect(freeze_body)
	
func collect_element():
	
	_global_datas.add_collect_element.emit(_element_data)
	queue_free()


func freeze_body(condition : bool):
	
	#print("debris was freezed", condition)
	freeze = condition
