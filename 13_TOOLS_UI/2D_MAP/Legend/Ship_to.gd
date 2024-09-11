extends Node


@export var _button : Button

func _ready():
	_button.pressed.connect(_ship_to)
	
	
func _ship_to():
	pass
	#_global_datas.sending_bird.emit()	
	
