extends Node

@export var _tool_data : tool_data
@export var list_of_object : Array[Node3D]

func _ready():
	_tool_data.select_this_tool_scene_prefabs.connect(active)	
	
func active(condition : bool):
	
	#print("active ",_tool_data, condition)
	for e in list_of_object:
		e.visible = condition
