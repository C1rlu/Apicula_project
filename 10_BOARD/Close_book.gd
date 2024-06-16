extends Node

@onready var book_close_root = $".."

func _ready():
	
	_global_datas.book_back_idle_position.connect(_show)
	
	
func _show(condition):
	book_close_root.visible = !condition	
