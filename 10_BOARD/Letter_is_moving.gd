extends Node


@export var On_Move : Node

func _ready():
	On_Move.On_Move.connect(_move)	


func _move(condition):
	
	if _global_datas.box_is_closed:
		_global_datas._letter_is_moving.emit(condition)
