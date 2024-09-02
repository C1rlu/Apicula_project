extends Node

@onready var shop = $".."


func _ready():
	_global_datas._open_shop.connect(_open_shop)		

func _open_shop(condition : bool):
	shop.visible = condition
