extends Node

@onready var root = $"../SubViewport/root"


func _ready():	
	_global_datas.set_tool_ui.connect(show_selected_ui)
	

func show_selected_ui(tool : tool_data):
			
	
	var _child =  root.get_children()
	
	for e in _child:
		e.queue_free()	
	
	var instance_ui = tool.ui_prefabs.instantiate()
	root.add_child(instance_ui)
	#print(tool.ui_prefabs)
