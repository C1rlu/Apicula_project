extends Node

@export var On_View : Node
func _ready():
	On_View.On_View.connect(_open_order)
	
	
func _open_order():
	#_global_datas._open_letter_quest.emit(true)
	_global_datas._back_letter.emit()	
