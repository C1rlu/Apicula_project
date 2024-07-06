extends Node


@export var object_list : Array[Node3D]

var active : bool = false



func _ready():
	
	if !active:
		return
	_global_datas.show_element_on_board.connect(show_obj)		
	
	for e in object_list:
		e.visible = false

func show_obj(value : int):
	
	if value >= object_list.size():
		print("PLS PUT AN OBJECT FOR THIS VALUE")
		return
	object_list[value].visible = true		
