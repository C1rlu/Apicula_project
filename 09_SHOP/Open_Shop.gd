extends Node

@onready var shop = $".."
@onready var boat = $"../HBoxContainer/BOAT"


func _ready():
	_global_datas._open_shop.connect(_open_shop)		
	_open_shop(false)	
func _open_shop(condition : bool):
	
	if _global_datas.Player_In_Inventory:
		return
	
	shop.visible = condition
	if condition:
		boat.grab_focus()
		_global_datas._add_back_call.emit(back_call)
		
func back_call():
	_open_shop(false)	
	
