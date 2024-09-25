extends Node

@export var root : Node3D
@export var On_View : Node
@export var On_Over : Node

var element : element_data

func _ready():
	On_View.On_View.connect(_focus)
	
	if On_Over:
		On_Over.On_Over.connect(_on_over)
		
func _focus():
	
	_global_datas._open_boad_Focus.emit(true,element)

	
func _on_over(condition : bool):
	if element:
		_global_datas._show_object_legend.emit(condition,element.element_name)
