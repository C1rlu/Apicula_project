extends Node

@export var info : info_data
@export var On_Over : Node

func _ready():
	On_Over.On_Over.connect(_on_over)		
		
	
func _on_over(condition : bool):
	if info:
		_global_datas._show_object_legend.emit(condition,info.info_node_name)
