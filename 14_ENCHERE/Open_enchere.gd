extends Node


@export var Offer_ui : Control


func _ready():
	_global_datas._open_enchere.connect(_open)
	#_global_datas._open_enchere.emit(false)
	
func _open(condition : bool):
		
	Offer_ui.visible = condition	
	
	
	#if condition:
		#_global_datas._open_object.emit(true,element)
	
