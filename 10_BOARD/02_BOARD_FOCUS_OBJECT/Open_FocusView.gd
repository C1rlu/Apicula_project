extends Node

@export var Render : TextureRect


func _ready():
	_global_datas._open_boad_Focus.connect(_open)
	
	
func _open(condition : bool):
	
	Render.visible = condition	
