extends Control


@onready var _coin_in_img = $_coin_in_img

func _coin_in(condition : bool):
	_coin_in_img.visible = !condition		
	
