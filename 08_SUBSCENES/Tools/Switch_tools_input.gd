extends Node


@export var tool_list : Array[tool_data]

func _ready():
	_global_datas.tools_list = tool_list
	
	for e in _global_datas.tools_list:
		var g_name = e.Tool_Name
		print(g_name)
		
		
func _input(event):
	
	if _global_datas.Player_InSubScene:
		return
	
	if event.is_action_pressed("Equip_Next_Tool"):
		print("test")	
