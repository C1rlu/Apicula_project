extends Node

@export var all_object_list : Array[Board_OBJ]

func _ready():
	_global_datas.add_OBJ.connect(add_this_obj)
	

func add_this_obj(obj_name):
	
	for o in all_object_list:
		if o.obj_name == obj_name:
			o.Object_on_Board = true
