extends Node3D


@export var list_of_lootable : Array[element_data]

const DEBRIS_TEST = preload("res://08_SUBSCENES/Elements/Magnetable_test/Debris_test.tscn")

@export var Breacking_me : Node

func _ready():
	
	Breacking_me.breaking_done.connect(_enable_lootable)

func _enable_lootable():

	for e in list_of_lootable:
		var instance = DEBRIS_TEST.instantiate()
		_global_datas.LoadScene.add_child(instance)
		instance.position = position
		instance._element_data = e
	
