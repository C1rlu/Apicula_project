extends Node

@export var info : info_data
@export var On_Over : Node

func _ready():
	On_Over.On_Over.connect(_show_info)		
		

func _show_info():
	
	_global_datas.show_element_info.emit(true,info)
