extends Node

@export var Money_text : Label
@export var Element_text : Label



func _ready():
	_global_datas.update_money_amount.connect(update_money)
	_global_datas.update_element_amount.connect(update_element)
	
	_subscene_datas._add_collect_element.connect(_update_element)
	_subscene_datas._remove_collect_element.connect(_update_element)
	
func update_money(value : int):
	var current = _global_datas.current_money + value
	_global_datas.current_money = current
	Money_text.text = str(_global_datas.current_money)
	
func update_element():

	var count : int = -1
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			count += 1		
	
	Element_text.text = str(count)
	
func _update_element(element):

	var count : int = 0
	for e in _global_datas.element_collected:
		if !e.Object_on_Board:
			count += 1		
	
	Element_text.text = str(count)
