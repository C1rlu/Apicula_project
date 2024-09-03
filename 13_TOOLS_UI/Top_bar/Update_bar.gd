extends Node

@export var Money_text : Label
@export var Element_text : Label



func _ready():
	_global_datas.update_money_amount.connect(update_money)
	
func update_money(value : int):
	var current = _global_datas.current_money + value
	_global_datas.current_money = current
	Money_text.text = str(_global_datas.current_money)
