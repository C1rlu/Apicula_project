extends RigidBody3D


@export var _element_data : element_data
@export var Element : Node

@onready var collision_shape_3d = $CollisionShape3D


@export var Debris : Node
func _ready():
	
	if _element_data.element_collected:
		print(_element_data.element_name, " was collected so removed from scene")
		queue_free()
		
	
	Element._collect.connect(_collect_element)
	Debris.freeze_body.connect(freeze_body)
	
func _collect_element():
	
	_subscene_datas._add_collect_element.emit(_element_data)
	_element_data.element_collected = true
	
	queue_free()
func freeze_body(condition : bool):
	
	#print("debris was freezed", condition)
	freeze = condition
